Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E451D4DA382
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 20:53:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ3xX4p6Wz3bX4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 06:53:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=DdjagM6i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=ebadger@purestorage.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=purestorage.com header.i=@purestorage.com
 header.a=rsa-sha256 header.s=google header.b=DdjagM6i; 
 dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ3wz0BRLz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 06:53:03 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id m22so434162pja.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q0Z/mKLEzNMGFhUbWMgWDYenOVpB+Pa0RFNSj7m6Lq0=;
 b=DdjagM6iLgCzTKKLhzNMMpzAvoMKa5fc95CsnEsQKICrPW80MBMPSL8FQwe5uHgRne
 RXt4V1BllKjKmpk354xuyBEOLu/sckjJQ1RvERNexLsSTJjBPfadOsH2xg5KFK6Aj5vN
 mZQUoj8QOCqRNk5BhjoQvb21U3wZRO5bpYjQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0Z/mKLEzNMGFhUbWMgWDYenOVpB+Pa0RFNSj7m6Lq0=;
 b=lQmmoYRQ4EmZVjao+jxF4ucM/fjGcI1jqrLUCzScsmB7hyC3D/Nq0uLJv9LOp56kOd
 2+XkAgE2fzQ0b08PBeMGtEgG31ZDjiffwK1fjZOJbEBLNGRWTg/miwwi/fxYwexaL/ZZ
 AiNg+FMv0tkvd3z2TcIflw2+SMpnUVWGWAzI/Q/cLpljX6YxfOIRvtx5Mv7DMDkRCcWL
 cVQoAhOcYFhwO8q6vYZJnPMm5hNDi0abOsAGXJTmQeDulcAmQIyuY29zEIzskklyWd2y
 kcrMbtjZZ/Q9vbi1ZnmvimiVer9ZSL7yiKD3KbpUsBjqerxZsFcn6XCx+HasDDuwRHWU
 enuw==
X-Gm-Message-State: AOAM532TnBnYRCr/6NM8l1WZMYIUOhdl/iaXhoutr72EZNWFZMIY6tX4
 FTvzSrdCaosMCYOPIfp7vSLm6Q==
X-Google-Smtp-Source: ABdhPJxVH1RzoNFr9lnuMz/Kq4V/O4Hk1z36zluI47SVOlMM23quvMSJX6PsAza8rFFcRnmxr300xw==
X-Received: by 2002:a17:902:da89:b0:153:349c:d240 with SMTP id
 j9-20020a170902da8900b00153349cd240mr23369729plx.73.1647373978733; 
 Tue, 15 Mar 2022 12:52:58 -0700 (PDT)
Received: from ebps (cpe-75-80-179-40.san.res.rr.com. [75.80.179.40])
 by smtp.gmail.com with ESMTPSA id
 z12-20020aa7888c000000b004f3fc6d95casm25503039pfe.20.2022.03.15.12.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 12:52:58 -0700 (PDT)
Date: Tue, 15 Mar 2022 12:52:55 -0700
From: Eric Badger <ebadger@purestorage.com>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2] PCI/AER: Handle Multi UnCorrectable/Correctable
 errors properly
Message-ID: <20220315195255.GA1523195@ebps>
References: <20220315050842.120063-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20220315171425.GA1521135@ebps>
 <2d4e8811-dce6-c891-e92d-e3746434685e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d4e8811-dce6-c891-e92d-e3746434685e@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebadger@purestorage.com, Oliver OHalloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 15, 2022 at 10:26:46AM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 3/15/22 10:14 AM, Eric Badger wrote:
> > >   # Prep injection data for a correctable error.
> > >   $ cd /sys/kernel/debug/apei/einj
> > >   $ echo 0x00000040 > error_type
> > >   $ echo 0x4 > flags
> > >   $ echo 0x891000 > param4
> > > 
> > >   # Root Error Status is initially clear
> > >   $ setpci -s <Dev ID> ECAP0001+0x30.w
> > >   0000
> > > 
> > >   # Inject one error
> > >   $ echo 1 > error_inject
> > > 
> > >   # Interrupt received
> > >   pcieport <Dev ID>: AER: Root Error Status 0001
> > > 
> > >   # Inject another error (within 5 seconds)
> > >   $ echo 1 > error_inject
> > > 
> > >   # No interrupt received, but "multiple ERR_COR" is now set
> > >   $ setpci -s <Dev ID> ECAP0001+0x30.w
> > >   0003
> > > 
> > >   # Wait for a while, then clear ERR_COR. A new interrupt immediately
> > >     fires.
> > >   $ setpci -s <Dev ID> ECAP0001+0x30.w=0x1
> > >   pcieport <Dev ID>: AER: Root Error Status 0002
> > > 
> > > Currently, the above issue has been only reproduced in the ICL server
> > > platform.
> > > 
> > > [Eric: proposed reproducing steps]
> > Hmm, this differs from the procedure I described on v1, and I don't
> > think will work as described here.
> 
> I have attempted to modify the steps to reproduce it without returning
> IRQ_NONE for all cases (which will break the functionality). But I
> think I did not correct the last few steps.

Well, the thinking in always returning IRQ_NONE was so that only setpci
modified the register and we could clearly see how writes to the
register affect interrupt generation.

> How about replacing the last 3 steps with following?
> 
>  # Inject another error (within 5 seconds)
>  $ echo 1 > error_inject
> 
>  # You will get a new IRQ with only multiple ERR_COR bit set
>  pcieport <Dev ID>: AER: Root Error Status 0002

This seems accurate. Though it does muddy a detail that I think was
clearer in the original procedure: was the second interrupt triggered by
the second error, or by the write of 0x1 to Root Error Status?

Also, in terms of practically running the test, I find the mdelay() can
block other interrupts and can make running the test sort of confusing
("is it not printing because the interrupt didn't fire, or because it's
spinning and blocking my NIC driver?" :).

Cheers,
Eric
