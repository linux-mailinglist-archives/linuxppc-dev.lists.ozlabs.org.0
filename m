Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440B86C2E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 08:57:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OcNZpG3O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SVCiZHVy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlk8R1b6Cz3vZj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 18:57:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OcNZpG3O;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SVCiZHVy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlk7c5rllz3c4V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 18:56:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709193384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZYUQ2/MyEIs+wTU4JfVi5JkU9l2GM3/3Nd9NcCBnAo=;
	b=OcNZpG3OqsPzefSEb+z7yVLiWaxHDw4HUkeb04QiETegz7Tlhyw0xJ736Ay30oBZuQ2gpy
	uwLfIUnvV+l1pziHTd3UTUK0HFOV7Hst26lC31qASqJBYt43dn+W8KMrf08DXNm9Xi8VU2
	Xbzt66PwreGN6UgicytwGfp2GSmwhNo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709193385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZYUQ2/MyEIs+wTU4JfVi5JkU9l2GM3/3Nd9NcCBnAo=;
	b=SVCiZHVyOpKDd8Rb+a1TSIVcyMibzkUsOw0AizCIdzh60HqThEkLHCq4EvOsitDRZNBdbI
	nd/GS4SX06DQEoe4AAGtGsecTer1Q6jyt72KZaT+bWpIq0Pjj0jAeT8C+PIRf5HnyherGh
	6G2I2X4Lge3oWbfTmSpsvKLiFYE0ghs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-OmpNWomLN_W3zw89ecYbKg-1; Thu, 29 Feb 2024 02:56:23 -0500
X-MC-Unique: OmpNWomLN_W3zw89ecYbKg-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-35fbab97a5cso2061215ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 23:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709193382; x=1709798182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZYUQ2/MyEIs+wTU4JfVi5JkU9l2GM3/3Nd9NcCBnAo=;
        b=iW5CohvZAwB8eMmP08OJ0y24CDX8wcXHcslywdNiCNQVU8IwoVC/ZMT0y7WLjevXHo
         +inYXY5Fwv8gHli8stsKI+3cKuqz6aHixK8w2PUOW0SSWj9YZ1KNkB5sSEbJUDvGEDXU
         DlYIpUcnLjj0ecisT9KSsjJgDSXm0w0uhmANwO1U9v6eWaCG+KrmMG7c3L9DmkgRJyee
         2VskE4Wtp1AYx3MtAHWhMB8cBIPdv9zD3Qo5V1KTpD7OhyQdAkdhwMSv2LScy0y/o9ra
         IbnsqYWNbrSfGCeNho2PmV0Ta99o+k4wO1/EJSd3K2zZ20tyiO8TZRVyhHC2sA579qTD
         aRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNJw/BPo2chpoOI3CTSw58/rPl8jvFrJ0IrndOJbE5fcARUB9vXG7W4Z3FgoRAMk7S1Ld1mVr3eAstUASfV3NL1RRQkWtpaaPy398/YA==
X-Gm-Message-State: AOJu0Yys8YHnjvlPet17qJZxzRqrpgF7q5Py/s60YHeoqszTmZfV44BZ
	WGHRcn/2UQ71deBBnR6ZOzTJkmKOPvT1WuPfx80SDRK+BQVoLEje5rkjmjrOo4l+oWPNv6Mgx5R
	O170vEUHLxeqhO9exyWzbYgJewn8KdHWKHw1JEDwiVlGB+NuP9xJI7dLj4lAZLAQ=
X-Received: by 2002:a05:6e02:20ee:b0:365:aeb8:26d1 with SMTP id q14-20020a056e0220ee00b00365aeb826d1mr1725573ilv.0.1709193382284;
        Wed, 28 Feb 2024 23:56:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK2Caj/CnSM8btPacrXhbRxxuWkGYLUk6S0weGtsslNFGdZ2LEbvNGX15pEdr1SssPwwCMDw==
X-Received: by 2002:a05:6e02:20ee:b0:365:aeb8:26d1 with SMTP id q14-20020a056e0220ee00b00365aeb826d1mr1725558ilv.0.1709193381990;
        Wed, 28 Feb 2024 23:56:21 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id ff11-20020a056a002f4b00b006e57b37a932sm664588pfb.9.2024.02.28.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 23:56:21 -0800 (PST)
Date: Thu, 29 Feb 2024 15:56:11 +0800
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/5] mm/treewide: Drop pXd_large()
Message-ID: <ZeA4m7DK03oHE1Kz@x1n>
References: <20240228085350.520953-6-peterx@redhat.com>
 <202402291233.CVhChP2c-lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202402291233.CVhChP2c-lkp@intel.com>
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
Cc: x86@kernel.org, Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, oe-kbuild-all@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 01:17:36PM +0800, kernel test robot wrote:
> >> arch/x86/include/asm/pgtable.h:1099:19: error: redefinition of 'pud_leaf'
>     1099 | static inline int pud_leaf(pud_t pud)
>          |                   ^
>    include/asm-generic/pgtable-nopmd.h:34:19: note: previous definition is here
>       34 | static inline int pud_leaf(pud_t pud)           { return 0; }
>          |                   ^

This is CONFIG_PGTABLE_LEVELS=2.  IIUC patch 5 didn't do anything wrong,
but when renaming pud_large() it caused this confliction, while in the past
it was a silent confliction between the old pud_leaf() macro and pud_leaf()
defintion, the macro could have silently overwrote the function.

IIUC such pud_leaf() is not needed as we have a global fallback.  I'll add
a pre-requisite patch to remove such pXd_leaf() definitions.

-- 
Peter Xu

