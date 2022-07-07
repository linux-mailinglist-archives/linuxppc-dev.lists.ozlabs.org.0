Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4256AFBE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 03:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfFqB2m86z3cKB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 11:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EzpeppBf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EzpeppBf;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdymS490zz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 00:03:03 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id b9so3546799pfp.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jul 2022 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=afbiyF16Fd4Ewaaf3EKKCpvpR7aHAsNAQp7K3TuQXs4=;
        b=EzpeppBfdoHkOWruUNAYNHzOi8S5lBuVkWR/uarc/O7MDVJ2qM1NUNdy3hxzZeKinw
         1f6tPe15AftcBiSP1Sugt5jiQpAKlLcyz+gPyHgHTvK6IkiuSg6SYHkmzqBCpGaHkm3K
         GirawtqITR+EFkG0pF8QxPm0bxzk97EH7JYJxQXFRi4d1kRfsZVOuxKRapjByLByJ3DF
         qAVqAZfaAfJT+F8T/W2rPtPmXy6/uaYwejGaDWQ5Frl3XCXwsQlqWF67lU3BIXdseGBS
         CTJ5pH+oR76s++4uNTCxHCZwHNyWF4xdxY3ay2k5fQlKGRbstnEbIjnAVDZkl7wMQgN9
         oSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=afbiyF16Fd4Ewaaf3EKKCpvpR7aHAsNAQp7K3TuQXs4=;
        b=PkZsv3ERJ2t9KWLSaxS3wDzoZj1PnhzB61Bo96vXC075C7/g5UR8pftHQyCqW17Mlq
         jISIjspYjeKGNtYct1IvqYLhX0/X/aswWFbrdk6wVby7Rh+K9/nLKqDdxoYyBX0iXXkG
         DuLSf/0uHgPkCED6sNaqlgGdKToOAmc/2XYE/aG1Z3IDBozNVq3mPf6N3keKX/ZprakK
         c4wTRkyIZqPFnl+910Phim2K6zMdSW1Fgyt1zvMRS+YqkGOthjPFBeX6qz4oemJsQDnu
         NGFDuxi92UGY+RDCvm9LZmF0VZBsaJ1TamuGhwiGs6MzC3BlhqLGGtHtzAUZaXeyoF98
         2WCw==
X-Gm-Message-State: AJIora8J48derZIROGa7QvOmthW0Xsfo90tnexzH0aqMTNblX9uTNXxp
	/rGCV5JO7XTtFbgmXOZC5og=
X-Google-Smtp-Source: AGRyM1uGEg1zRLKU3mt/8yK/HfEqKFBdv1eoQpzxhqHLW6DjIp1gLh6JEsU/RWRdBfoHFypH/TfaNQ==
X-Received: by 2002:a17:90b:4c8f:b0:1ec:cdd0:41b7 with SMTP id my15-20020a17090b4c8f00b001eccdd041b7mr5420238pjb.119.1657202580508;
        Thu, 07 Jul 2022 07:03:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k127-20020a632485000000b004148cbdd4e5sm1215293pgk.57.2022.07.07.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:02:59 -0700 (PDT)
Date: Thu, 7 Jul 2022 07:02:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [linux-next:master] BUILD REGRESSION
 088b9c375534d905a4d337c78db3b3bfbb52c4a0
Message-ID: <20220707140258.GA3492673@roeck-us.net>
References: <62c683a2.g1VSVt6BrQC6ZzOz%lkp@intel.com>
 <YsaUgfPbOg7WuBuB@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsaUgfPbOg7WuBuB@kroah.com>
X-Mailman-Approved-At: Fri, 08 Jul 2022 11:20:55 +1000
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
Cc: nvdimm@lists.linux.dev, legousb-devel@lists.sourceforge.net, dri-devel@lists.freedesktop.org, linux-sctp@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, ceph-devel@vger.kernel.org, linux-pm@vger.kernel.org, usbb2k-api-dev@nongnu.org, linux-omap@vger.kernel.org, megaraidlinux.pdl@broadcom.com, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-perf-users@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-wpan@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-parport@lists.infradead.org, linux-doc@vger.kernel.org, samba-technical@lists.samba.org, linux-cxl@vger.kernel.org, virtualization@lists.linux-foundation.org, dm-devel@redhat.com, target-devel@vger.kernel.org, dev@openvswitch.org, linux-cifs@vger.kernel.org, kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, iomm
 u@lists.linux.dev, coreteam@netfilter.org, linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, greybus-dev@lists.linaro.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-efi@vger.kernel.org, linux-iio@vger.kernel.org, linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org, alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org, cgroups@vger.kernel.org, linux-phy@lists.infradead.org, sound-open-firmware@alsa-project.org, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, amd-gfx@lists.freedesktop.org, isdn4linux@listserv.isdn4linux.de, linux-input@vger.kernel.org, linux-ext4@vger.kernel.org, ath11k@lists.infradead.org, mjpeg-users@lists.sourceforge.net, openipmi-developer@lists.sourceforge.net, linux-hwmon@vger.kernel.org, linux-parisc@vger.kernel.org, linux-ide@vger.kernel
 .org, linux-mmc@vger.kernel.org, iommu@lists.linux-fo

undation.org, keyrings@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org, damon@lists.linux.dev, linux-mm@kvack.org, accessrunner-general@lists.sourceforge.net, linux1394-devel@lists.sourceforge.net, linux-leds@vger.kernel.org, rds-devel@oss.oracle.com, linux-x25@vger.kernel.org, dccp@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-nfc@lists.01.org, osmocom-net-gprs@lists.osmocom.org, apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-scsi@vger.kernel.org, patches@opensource.cirrus.com, linux-unionfs@vger.kernel.org, linux-bluetooth@vger.kernel.org, ntb@lists.linux.dev, tipc-discussion@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 07, 2022 at 10:08:33AM +0200, Greg KH wrote:

[ ... ]
> > 
> > Unverified Error/Warning (likely false positive, please contact us if interested):
> > 
> > arch/x86/events/core.c:2114 init_hw_perf_events() warn: missing error code 'err'
> > drivers/android/binder.c:1481:19-23: ERROR: from is NULL but dereferenced.
> > drivers/android/binder.c:2920:29-33: ERROR: target_thread is NULL but dereferenced.
> > drivers/android/binder.c:353:25-35: ERROR: node -> proc is NULL but dereferenced.
> > drivers/android/binder.c:4888:16-20: ERROR: t is NULL but dereferenced.
> > drivers/base/regmap/regmap.c:1996:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/char/random.c:869:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/firmware/arm_scmi/clock.c:394:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/firmware/arm_scmi/powercap.c:376:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.c:1214:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/gpu/drm/amd/display/dc/os_types.h: drm/drm_print.h is included more than once.
> > drivers/gpu/drm/bridge/ite-it66121.c:1398:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/greybus/operation.c:617:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> 
> <snip>
> 
> When the compiler crashes, why are you blaming all of these different
> mailing lists?  Perhaps you need to fix your compiler :)
> 

To be fair, it says above "likely false positive, please contact us
if interested". Also, the 32-bit build errors _are_ real, and the NULL
dereferences in the binder driver are at the very least suspicious.

Guenter
