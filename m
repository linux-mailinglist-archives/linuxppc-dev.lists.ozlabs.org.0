Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68E5FD881
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 13:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp6xY5V4Sz3dtM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 22:39:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4/rn0ND;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=ville.syrjala@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4/rn0ND;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnbRS5GKBz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 02:00:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665586804; x=1697122804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=p5FnZ4+f6pmWst9wSfrEJB9i2nRqQShtidpftxEjnbE=;
  b=k4/rn0NDF0J2cHR0rRdy3Ww4lzeVFJz5efWFGMon6C1w+0h0EAASwG9Z
   x8YKSDWYjfxpOE5jE2aylmCjcnTTGNqpJikbgSrTQ/CJ5O929q1O+iGOj
   JQ0MRSPqIfXDfe7LrXI6XyMwE5o3Eed9a9OSXJjC4sXzh1Tgm8B61wLX6
   A0uFfHjjZQq03w/nu0egityXuLJkARoNH8TkHtecY4vcpArAY3uM9EdDZ
   KMlEyM/thwN5+YqF2X8ksGNHdVHWO/4ZJXCVInDPHmW/B8VUBajmGL8dh
   osBjnzbQtnbkR/6U62Y4l9Yz9C3jGoRHTe12xhwrOp+nhxOEHRzItDodw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="331308573"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="331308573"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 07:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="731455010"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="731455010"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
  by fmsmga002.fm.intel.com with SMTP; 12 Oct 2022 07:59:46 -0700
Received: by stinkbox (sSMTP sendmail emulation); Wed, 12 Oct 2022 17:59:45 +0300
Date: Wed, 12 Oct 2022 17:59:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <Y0bWYb0z1HZ2PztG@intel.com>
References: <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
 <a81e1acf-64dd-f69d-d97f-4a1af534e8e6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a81e1acf-64dd-f69d-d97f-4a1af534e8e6@suse.de>
X-Patchwork-Hint: comment
X-Mailman-Approved-At: Thu, 13 Oct 2022 22:37:49 +1100
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Suchanek <msuchanek@suse.de>, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 04:31:14PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.10.22 um 15:12 schrieb Arnd Bergmann:
> > On Wed, Oct 12, 2022, at 2:00 PM, Thomas Zimmermann wrote:
> >>
> >> Could well be. But ofdrm intents to replace offb and this test has
> >> worked well in offb for almost 15 yrs. If there are bug reports, I'm
> >> happy to take patches, but until then I see no reason to change it.
> > 
> > I wouldn't change the code in offb unless a user reports a bug,
> > but I don't see a point in adding the same mistake to ofdrm if we
> > know it can't work on real hardware.
> 
> As I said, this has worked with offb and apparently on real hardware. 
> For all I know, ATI hardware (before it became AMD) was used in PPC 
> Macintoshs and assumed big-endian access on those machines.

At least mach64 class hardware has two frame buffer apertures, and
byte swapping can be configured separately for each. But that means
you only get correct byte swapping for at most two bpps at the same
time (and that only if you know which aperture to access each time).
IIRC Rage 128 already has the surface register stuff where you
could byte swap a limited set of ranges independently. And old
mga hardware has just one byte swap setting for the whole frame
buffer aperture, so only one bpp at a time.

That kind of horrible limitations of the byte swappers is the
main reason why I wanted to make drm fourcc endianness explicit.
Simply assuming host endianness would end in tears on big endian
as soon as you need to access stuff with two bpps at the same time.
Much better to just switch off those useless byte swappers and
swap by hand when necessary.

-- 
Ville Syrjälä
Intel
