Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30425240D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 01:20:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BblNK6mRczDqYk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 09:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g17iV+Lc; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BblLZ3VSbzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 09:19:16 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id l191so87597pgd.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 16:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nzT4cIv5aZloZUa85ooGLcuJKku+lTzXEIFwdhhhrM4=;
 b=g17iV+Lc6aSBOLe+PXWahWJW6Y2WovRbdTAFwXkgWGEBHeis8BwaGJ1/CrBTJ6wOxj
 UKRTRHo+JKIkjHdtn9pMcUYhCibnMervY6vIJWwS4RQlE3LSjVqmLUTaL39UbAGj4g6L
 0j0826j4CHEZnT2exq6W7xhcrJUuL+xeGwEr2VpfFjtGbo9lANRsknS4EVWyKfxKl7Il
 /yIG9aDg8s8XYB33HFnAKY/2MhxQ2vY2S/m+geHEPThOE90LQ6W/H7XBdg78bySpsa/G
 t/9acHQaOTqhr0MpHdKlJO7fxd8cXHOELXVJXXUfDBije2GdrgU/aZZQogR8XNVpmWFo
 c4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nzT4cIv5aZloZUa85ooGLcuJKku+lTzXEIFwdhhhrM4=;
 b=ii1CqobwV8DEjEouXwFuPB+p6DrfpndzBBx81NHlVnoj2qhS3LJLq+zlm0IHOxlI1V
 p68V+7mfEvRU4qR34Bv7OPXwi0zKKCznP6C14X5b4mhwVwxdqu4VePBB0X0+6rG3xF/5
 O+Ov+5a4bXoBnSOg/xF9kynX2Eg/emsH0MsmqmiIQXKiE/Ka9Jkck8uMH16uwUqwHauS
 psbXOEKKsRGTKWjAH84UE9ke27OUOQaINRbp2SBpVL8bO+rd8dEYxXX0bYtey5qsF6d4
 WwUlH5DW7QkRirVJmhouPj/GYUU3eXtmQkqvaDPxyt5Vkd3FmpFLwlIx0mb20opvVxLU
 jDHA==
X-Gm-Message-State: AOAM530aw5SYzQNcsshNqraIDGvmemhdKyDYjn4zyDkuatu3aNacN6j9
 d7amdkls5xFaVPi1iGgNhlw=
X-Google-Smtp-Source: ABdhPJyK06Dvh5ZLh8ZEvQMG4jqMYYcFE+LKTmieWcScqEbOmexcuH0IBvKor0u/mjocM4FCOCK/kw==
X-Received: by 2002:a63:4545:: with SMTP id u5mr8237031pgk.229.1598397551754; 
 Tue, 25 Aug 2020 16:19:11 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id v78sm344700pfc.121.2020.08.25.16.19.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 16:19:11 -0700 (PDT)
Date: Tue, 25 Aug 2020 16:19:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFT][PATCH 0/7] Avoid overflow at boundary_size
Message-ID: <20200825231900.GA4726@Asurada-Nvidia>
References: <20200820231923.23678-1-nicoleotsuka@gmail.com>
 <4321af30-9554-6897-5281-05afd88f2631@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4321af30-9554-6897-5281-05afd88f2631@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-ia64@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, hch@lst.de,
 sfr@canb.auug.org.au, deller@gmx.de, x86@kernel.org, borntraeger@de.ibm.com,
 mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, ink@jurassic.park.msu.ru,
 tglx@linutronix.de, gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 tony.luck@intel.com, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Niklas,

On Tue, Aug 25, 2020 at 12:16:27PM +0200, Niklas Schnelle wrote:
> On 8/21/20 1:19 AM, Nicolin Chen wrote:
> > We are expending the default DMA segmentation boundary to its
> > possible maximum value (ULONG_MAX) to indicate that a device
> > doesn't specify a boundary limit. So all dma_get_seg_boundary
> > callers should take a precaution with the return values since
> > it would easily get overflowed.
> > 
> > I scanned the entire kernel tree for all the existing callers
> > and found that most of callers may get overflowed in two ways:
> > either "+ 1" or passing it to ALIGN() that does "+ mask".
> > 
> > According to kernel defines:
> >     #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
> >     #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)
> > 
> > We can simplify the logic here:
> >   ALIGN(boundary + 1, 1 << shift) >> shift
> > = ALIGN_MASK(b + 1, (1 << s) - 1) >> s
> > = {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
> > = [b + 1 + (1 << s) - 1] >> s
> > = [b + (1 << s)] >> s
> > = (b >> s) + 1
> > 
> > So this series of patches fix the potential overflow with this
> > overflow-free shortcut.
 
> haven't seen any other feedback from other maintainers,

I am wondering this too...whether I sent correctly or not.

> so I guess you will resend this?

Do I need to? Though I won't mind doing so if it's necessary..

> On first glance it seems to make sense.
> I'm a little confused why it is only a "potential overflow"
> while this part
> 
> "We are expending the default DMA segmentation boundary to its
>  possible maximum value (ULONG_MAX) to indicate that a device
>  doesn't specify a boundary limit"
> 
> sounds to me like ULONG_MAX is actually used, does that
> mean there are currently no devices which do not specify a
> boundary limit?

Sorry for the confusion. We actually applied ULONG_MAX change
last week but reverted it right after, due to a bug report at
one of these "potential" overflows. So at this moment the top
of the tree doesn't set default boundary to ULONG_MAX yet.

Thanks
Nic
