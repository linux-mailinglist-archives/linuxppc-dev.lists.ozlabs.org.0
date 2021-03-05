Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0345832EBF6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 14:17:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsSvV6sQvz3dLh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 00:17:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ReTeGMZI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K0ggcfW9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ReTeGMZI; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=K0ggcfW9; 
 dkim-atps=neutral
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir;
 Sat, 06 Mar 2021 00:17:04 AEDT
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsSv41hLcz3cLT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 00:17:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614950221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PiQC+uQ8/mlUsecAEljowa+aXvv8b60u/bfT+sFz7pE=;
 b=ReTeGMZI6ceBR2P84sHyHfBNDHpT2rJYR+mDN5xvK7VfKB0pphfkm48XtQlHLFI+kF/J23
 ZV/Dpch4N+yB11GNugcP+u9kHrMbCLE44hX4qnivpubhet+kapkNo53HDR5YHsrTlzqO+Q
 MDSfQXlM3IjggQGipSLRt5u7+ppwseA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614950222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PiQC+uQ8/mlUsecAEljowa+aXvv8b60u/bfT+sFz7pE=;
 b=K0ggcfW9oWosuXi/tF3Ryxo1AYnE7mEIp0R6YVfaTnUw/BMDS+YqFha7npnqdJqUMJD958
 u+fGrF+j4nl2slOFMKhMIcdPYo1NI9RomOSnt5IFk3B7V9tm9JZHvh5D3Av2AAjnnxoQHA
 aJaLXG6PdoKJlFjgP0yAySE77ATB9w8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-0oQyk_QsPwSt9dclDBEZug-1; Fri, 05 Mar 2021 08:15:48 -0500
X-MC-Unique: 0oQyk_QsPwSt9dclDBEZug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C5F108BD09;
 Fri,  5 Mar 2021 13:15:47 +0000 (UTC)
Received: from krava (unknown [10.40.196.10])
 by smtp.corp.redhat.com (Postfix) with SMTP id 38F6E60C43;
 Fri,  5 Mar 2021 13:15:46 +0000 (UTC)
Date: Fri, 5 Mar 2021 14:15:45 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Fix instruction encoding for lis in
 ppc_function_entry()
Message-ID: <YEIvAYZiMi5Dwrj1@krava>
References: <20210304020411.16796-1-naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210304020411.16796-1-naveen.n.rao@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 07:34:11AM +0530, Naveen N. Rao wrote:
> 'lis r2,N' is 'addis r2,0,N' and the instruction encoding in the macro
> LIS_R2 is incorrect (it currently maps to 'addis 0,r2,N'). Fix the same.
> 
> Fixes: c71b7eff426fa7 ("powerpc: Add ABIv2 support to ppc_function_entry")
> Reported-by: Jiri Olsa <jolsa@redhat.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/code-patching.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> index eacc9102c2515c..d5b3c3bb95b400 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -73,7 +73,7 @@ void __patch_exception(int exc, unsigned long addr);
>  #endif
>  
>  #define OP_RT_RA_MASK	0xffff0000UL
> -#define LIS_R2		0x3c020000UL
> +#define LIS_R2		0x3c400000UL
>  #define ADDIS_R2_R12	0x3c4c0000UL
>  #define ADDI_R2_R2	0x38420000UL
>  
> 
> base-commit: 91966823812efbd175f904599e5cf2a854b39809
> -- 
> 2.25.1
> 

I tested the new define value with uprobe issue we were dealing with
and now it matches the instruction, so it works for me

thanks a lot for the fix,
jirka

