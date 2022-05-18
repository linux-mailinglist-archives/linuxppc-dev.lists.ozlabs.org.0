Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AD52B79D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L382q29QHz3f5f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:13:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FiFA70hB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IGrp0s5L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FiFA70hB; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IGrp0s5L; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L380q17JFz3dx6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:11:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652868709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nTmAGYeo/KWqrKBReXCJ9t3d+BdhVvSDQVlxQc2ZGz4=;
 b=FiFA70hBn3hM1fEokQtKMAefQ0fT5x0hvNyXXyoYBSWF6xl/Af8Rh9TEnaI3jFDzYzkPc5
 qyV1F8a3ouXQ56FUTz7O331VsaNj8p/sE722P8tfT8XAaB6aWiYh3r24VRKyK1NldiQPdk
 Hf7NUUpfq6/Na2sg4oorizHFRxrVvPc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652868710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nTmAGYeo/KWqrKBReXCJ9t3d+BdhVvSDQVlxQc2ZGz4=;
 b=IGrp0s5Ln1C7fd1SXcCZH1195J19UK2Np5gxnQfRT6TgZi2/TyCpMBaujWuul6Q/kO2YcU
 rY+D+X+lnJwcJFNFUIkkmSl/mDS2VaaAccYKWACHItMWKELekZ1TEkxEmLmFp/CZ23cti2
 STzt9DHPUcIm8HkPpFgAWRBBNElG1XM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410--n_Ee2GzPv6Nx4IpeWbu0g-1; Wed, 18 May 2022 06:11:46 -0400
X-MC-Unique: -n_Ee2GzPv6Nx4IpeWbu0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC7780B712;
 Wed, 18 May 2022 10:11:45 +0000 (UTC)
Received: from localhost (ovpn-13-59.pek2.redhat.com [10.72.13.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC81E1410DD5;
 Wed, 18 May 2022 10:11:44 +0000 (UTC)
Date: Wed, 18 May 2022 18:11:41 +0800
From: Baoquan He <bhe@redhat.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
Message-ID: <YoTGXQvQutAR5PZY@MiWiFi-R3L-srv>
References: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
 <YoNqJ/MOSIVwKP/o@MiWiFi-R3L-srv>
 <1652782155.56t7mah8ib.naveen@linux.ibm.com>
 <8735h8b2f1.fsf@email.froward.int.ebiederm.org>
 <87v8u3o9tk.fsf@mpe.ellerman.id.au>
 <YoSk+jRjNQtUL50d@MiWiFi-R3L-srv>
 <1652864763.xpq371r1wx.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652864763.xpq371r1wx.naveen@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/18/22 at 02:48pm, Naveen N. Rao wrote:
> Baoquan He wrote:
> > On 05/18/22 at 12:26pm, Michael Ellerman wrote:
> > > 
> > > It seems that recordmcount is not really maintained anymore now that x86
> > > uses objtool?
> > > 
> > > There've been several threads about fixing recordmcount, but none of
> > > them seem to have lead to a solution.
> > > 
> > > These weak symbol vs recordmcount problems have been worked around going
> > > back as far as 2020:
> > 
> > It gives me feeling that llvm or recordmcount should make adjustment,
> > but not innocent kernel code, if there are a lot of places reported.
> > I am curious how llvm or recordmcount dev respond to this.
> 
> As Michael stated, this is not just llvm - binutils has also adopted the
> same and "unused" section symbols are being dropped.
> 
> For recordmcount, there were a few threads and approaches that have been
> tried:
> - https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cd0f6bdfdf1ee096fb2c07e7b38940921b8e9118.1637764848.git.christophe.leroy@csgroup.eu/
> - https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=297434&state=*
> 
> Objtool has picked up a more appropriate fix for this recently, and
> long-term, we would like to move to using objtool for ftrace purposes:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/tools/objtool/elf.c?id=4abff6d48dbcea8200c7ea35ba70c242d128ebf3
> 
> While that is being pursued, we want to unbreak some of the CI and users who
> are hitting this.

I see, thanks for the details. I would persue fix in recordmcount if
possible, while has no objection to fix it in kernel with justification
if have to. Given my limited linking knowledge, leave this to other
expert to decide.

