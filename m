Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8F903E8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 16:18:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJWKF2AB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJWKF2AB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz9kn2BcPz3cYm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 00:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJWKF2AB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJWKF2AB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz9k45YCBz3cXJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 00:17:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718115463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jE1WXL5kXHxZ8d5bW4A1JQT02tpPoLrfA0795fkkSac=;
	b=GJWKF2ABExDQL3MFzwYiOBpRI4KlfI+Qtr6e2ofub3oCkloHgiZ+e402izVKfQob7VXmaX
	YeScXPBvXQi1R03WkIkm03IojFhE598pk9PvvJCi2+BAP4jaIQGxViKAsNdao1ZKHXVjVW
	NXgf6pEr3zyqS4DFJcRP672TdLFRf1k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718115463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jE1WXL5kXHxZ8d5bW4A1JQT02tpPoLrfA0795fkkSac=;
	b=GJWKF2ABExDQL3MFzwYiOBpRI4KlfI+Qtr6e2ofub3oCkloHgiZ+e402izVKfQob7VXmaX
	YeScXPBvXQi1R03WkIkm03IojFhE598pk9PvvJCi2+BAP4jaIQGxViKAsNdao1ZKHXVjVW
	NXgf6pEr3zyqS4DFJcRP672TdLFRf1k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-5OqyykCpMhC1qN2O2YvUFg-1; Tue, 11 Jun 2024 10:17:41 -0400
X-MC-Unique: 5OqyykCpMhC1qN2O2YvUFg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b062567efdso411476d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 07:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718115460; x=1718720260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE1WXL5kXHxZ8d5bW4A1JQT02tpPoLrfA0795fkkSac=;
        b=I9FAO1968y+jnMxFN4nuKOzUbocnz+d6J33CTRaBWuX/+mjLjwEMKgXY3zfw+MOeHA
         vvW8BrurO2g9cZcFfyiaf50LhC78WjQBG40V45vu1e1EleT+sxQkkxEjBEx5NaGHlhXb
         pBVZdkEB4h5ag4pS5shPIbvFPVbrLxTTc8QW8xWBZxXEwiNJogQJ8f06BNHetm9NE3h6
         bQR7MAuBI42pZV8KmrUDDbz9wguZb34PNfpjDBStTIDFghURhRO+Eq316aRNYj3FNwfO
         OA3zX+3V7v88MY4GzllcaIFbUR3tkKY4sjwkg2SGrPb9eZ9DoCprcvoddqHESW+QaDAk
         RMsg==
X-Forwarded-Encrypted: i=1; AJvYcCXZzaH+AGojIN4ZXIUGeVqY5QQACwqO+K3fBpuRtuDAXJUGT9jxYDI1p06RXafrI5TC6d1+NVPJsD8VkguYeXHPJ1TGmsahNdkSpNO6Zw==
X-Gm-Message-State: AOJu0Yy94tb0dJjOLPir2bPoiC1/gMsF5DaQlUOA70YpT34Elryp1wSZ
	xZqP2toBWWzxeCa1F24syI6+Zh+V4liBWOdwb8EJRHwJBMD1KMTpmdfCXWfr84QSLL82o5nn0Gf
	MjecABkQYigvqFdIU+6UbWOlm83CFlTKk9P6cOK9n9gE58w2PeBL9CfgXcyfbdyI=
X-Received: by 2002:ad4:4425:0:b0:6b0:6e0a:4da8 with SMTP id 6a1803df08f44-6b06e0a5003mr90869726d6.1.1718115460054;
        Tue, 11 Jun 2024 07:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfzYLXL/Zzs2Dj1xAt8VEOpOAcqtFphruxKx4ngQRSZQuqsTYigZMQ12LgrL5w44f93GNlSQ==
X-Received: by 2002:ad4:4425:0:b0:6b0:6e0a:4da8 with SMTP id 6a1803df08f44-6b06e0a5003mr90869266d6.1.1718115459381;
        Tue, 11 Jun 2024 07:17:39 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b07520d999sm29500596d6.37.2024.06.11.07.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 07:17:38 -0700 (PDT)
Date: Tue, 11 Jun 2024 10:17:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Message-ID: <ZmhcepJrkDpJ7mSC@x1n>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <ZmgaHyS0izhtKbx6@localhost.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oscar,

On Tue, Jun 11, 2024 at 11:34:23AM +0200, Oscar Salvador wrote:
> Which means that they would be caught in the following code:
> 
>         ptl = pmd_huge_lock(pmd, vma);
>         if (ptl) {
> 	        - 8MB hugepages will be handled here
>                 smaps_pmd_entry(pmd, addr, walk);
>                 spin_unlock(ptl);
>         }
> 	/* pte stuff */
> 	...

Just one quick comment: I think there's one challenge though as this is
also not a generic "pmd leaf", but a pgtable page underneath.  I think it
means smaps_pmd_entry() won't trivially work here, e.g., it will start to
do this:

	if (pmd_present(*pmd)) {
		page = vm_normal_page_pmd(vma, addr, *pmd);

Here vm_normal_page_pmd() will only work if pmd_leaf() satisfies its
definition as:

 * - It should contain a huge PFN, which points to a huge page larger than
 *   PAGE_SIZE of the platform.  The PFN format isn't important here.

But now it's a pgtable page, containing cont-ptes.  Similarly, I think most
pmd_*() helpers will stop working there if we report it as a leaf.

Thanks,

-- 
Peter Xu

