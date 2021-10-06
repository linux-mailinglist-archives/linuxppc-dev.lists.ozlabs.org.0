Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E6423FB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 16:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPbjS1c7Pz3bXY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 01:01:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=M1lfx0kL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=ionos.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=jinpu.wang@ionos.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256
 header.s=google header.b=M1lfx0kL; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPbhm2GJRz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 01:01:09 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id f9so10445732edx.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35EUUIGUPuPs3VKMXkEpOsYeHNYeLxuc/OClkXfI9o0=;
 b=M1lfx0kLa1W2L5C/VBerqruuYLo7NFTWMlkHFHmg7yM3G3D5DzadveotHBvrw8+oxN
 zbzkd3AtxMOAIKvzWDdVi/hmgVc2Pf0d9/LcU+SLicaeSL/gXP693EkxIhyiuQOdqnrs
 4Q6JIq6gUneoEqF4gEOSUXdA43Dki3Uj7zyeAe8LuQpsdwWOcxtk4gzEvBLsheOkZbcI
 t7y6hYJKxAXIQ2Alp1xZexaVLHCU5aaOnB1JaEJmYDMN676yH6DJ9PQd1fZpCskpnk1U
 omnIbKInlTuBq1BwhpN19h8JD+l2shatYOTcVtwNcLxAb7xwsDOYzaaAmJmU2bgATIBW
 nzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35EUUIGUPuPs3VKMXkEpOsYeHNYeLxuc/OClkXfI9o0=;
 b=LZ5m7B2GemGtYtqWQDK2Wqj8yXzsNrGyWDSQVxH4ut9geiKkCmcLD7Fal/MiEyIgIO
 Gxkw4B4rn1D6BHHkNi4QGiOez/ZNCcxAemTPMUV6bVThWoUTLWnWtF8SIXpwJcZkgw5u
 FpWp1VJESy1vX1nGe2bI5zzlwsQzxoqp2z4+nq8VQWbzlBrDsFHAkwXSs/SXgs6MMMsL
 0unVmP5usbzuTNRmt85abTolCPv6qiIAu4/iU2sMV9jtCa0Xdg08zgfK4dl2X+t4N53L
 lY74IVhuDZ8annj6sOxGGuySMK9KFmJJN/haO7OUyxnF76EmyOiI68CLogXGV3n+D5Ra
 gL/g==
X-Gm-Message-State: AOAM533Ry+ft5tsmt/O3NPwMQDiIfKfoYEvgSnj+t7FL9FtNQ4rNuc6Q
 dhyN9Mfru8eZHmeEyei7vJj0iybO3MB7a119ca7Xcg==
X-Google-Smtp-Source: ABdhPJyxL32NpITVFTiruqI0fg5s2SIaIwN+uNZ4Qmf3DRbji2E37Xp76Z5397gMi4zmZmazD5lwqNQd/C4wN3/WNP0=
X-Received: by 2002:a17:906:5d6:: with SMTP id
 t22mr32911283ejt.98.1633528845665; 
 Wed, 06 Oct 2021 07:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211006132104.105288-1-sohaib.amhmd@gmail.com>
In-Reply-To: <20211006132104.105288-1-sohaib.amhmd@gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 6 Oct 2021 16:00:35 +0200
Message-ID: <CAMGffEm65An5K0cuNRTVHCO1voBs6AvsqJ1US=cFP3fddSpmZQ@mail.gmail.com>
Subject: Re: [PATCH] docs: typo fixes in Documentation/ABI/
To: Sohaib Mohamed <sohaib.amhmd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daejun Park <daejun7.park@samsung.com>, Gioh Kim <gi-oh.kim@ionos.com>,
 Can Guo <cang@codeaurora.org>, Bean Huo <beanhuo@micron.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Carlos Bilbao <bilbao@vt.edu>,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 6, 2021 at 3:21 PM Sohaib Mohamed <sohaib.amhmd@gmail.com> wrote:
>
> All these changes are about to remove repeated words from severals place in the Documentation/ABI/ directory:
>

>
> - In file testing/sysfs-class-rnbd-client:131: "as as the"
>
> - In file testing/sysfs-class-rtrs-client:81: "the the name"
>
> - In file testing/sysfs-class-rtrs-server:27: "the the name"
For all 3 rtrs/rnbd changes, all look good to me.
Acked-by: Jack Wang <jinpu.wang@ionos.com>

Thanks!
>  Documentation/ABI/stable/sysfs-module                     | 2 +-
>  Documentation/ABI/testing/sysfs-bus-rapidio               | 2 +-
>  Documentation/ABI/testing/sysfs-class-cxl                 | 4 ++--
>  Documentation/ABI/testing/sysfs-class-rnbd-client         | 2 +-
>  Documentation/ABI/testing/sysfs-class-rtrs-client         | 2 +-
>  Documentation/ABI/testing/sysfs-class-rtrs-server         | 2 +-
>  Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD | 2 +-
>  Documentation/ABI/testing/sysfs-devices-power             | 2 +-
>  Documentation/ABI/testing/sysfs-driver-ufs                | 2 +-
>  Documentation/ABI/testing/sysfs-firmware-acpi             | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
> index 560b4a3278df..41b1f16e8795 100644
> --- a/Documentation/ABI/stable/sysfs-module
> +++ b/Documentation/ABI/stable/sysfs-module
> @@ -38,7 +38,7 @@ What:         /sys/module/<MODULENAME>/srcversion
>  Date:          Jun 2005
>  Description:
>                 If the module source has MODULE_VERSION, this file will contain
> -               the checksum of the the source code.
> +               the checksum of the source code.
>
>  What:          /sys/module/<MODULENAME>/version
>  Date:          Jun 2005
> diff --git a/Documentation/ABI/testing/sysfs-bus-rapidio b/Documentation/ABI/testing/sysfs-bus-rapidio
> index f8b6728dac10..9e8fbff99b75 100644
> --- a/Documentation/ABI/testing/sysfs-bus-rapidio
> +++ b/Documentation/ABI/testing/sysfs-bus-rapidio
> @@ -95,7 +95,7 @@ Contact:      Matt Porter <mporter@kernel.crashing.org>,
>                 Alexandre Bounine <alexandre.bounine@idt.com>
>  Description:
>                 (RO) returns name of previous device (switch) on the path to the
> -               device that that owns this attribute
> +               device that owns this attribute
>
>  What:          /sys/bus/rapidio/devices/<nn>:<d>:<iiii>/modalias
>  Date:          Jul, 2013
> diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/testing/sysfs-class-cxl
> index 3c77677e0ca7..594fda254130 100644
> --- a/Documentation/ABI/testing/sysfs-class-cxl
> +++ b/Documentation/ABI/testing/sysfs-class-cxl
> @@ -103,8 +103,8 @@ What:           /sys/class/cxl/<afu>/api_version_compatible
>  Date:           September 2014
>  Contact:        linuxppc-dev@lists.ozlabs.org
>  Description:    read only
> -                Decimal value of the the lowest version of the userspace API
> -                this this kernel supports.
> +                Decimal value of the lowest version of the userspace API
> +                this kernel supports.
>  Users:         https://github.com/ibm-capi/libcxl
>
>
> diff --git a/Documentation/ABI/testing/sysfs-class-rnbd-client b/Documentation/ABI/testing/sysfs-class-rnbd-client
> index 0b5997ab3365..e6cdc851952c 100644
> --- a/Documentation/ABI/testing/sysfs-class-rnbd-client
> +++ b/Documentation/ABI/testing/sysfs-class-rnbd-client
> @@ -128,6 +128,6 @@ Description:        For each device mapped on the client a new symbolic link is created
>                 The <device_id> of each device is created as follows:
>
>                 - If the 'device_path' provided during mapping contains slashes ("/"),
> -                 they are replaced by exclamation mark ("!") and used as as the
> +                 they are replaced by exclamation mark ("!") and used as the
>                   <device_id>. Otherwise, the <device_id> will be the same as the
>                   "device_path" provided.
> diff --git a/Documentation/ABI/testing/sysfs-class-rtrs-client b/Documentation/ABI/testing/sysfs-class-rtrs-client
> index 49a4157c7bf1..fecc59d1b96f 100644
> --- a/Documentation/ABI/testing/sysfs-class-rtrs-client
> +++ b/Documentation/ABI/testing/sysfs-class-rtrs-client
> @@ -78,7 +78,7 @@ What:         /sys/class/rtrs-client/<session-name>/paths/<src@dst>/hca_name
>  Date:          Feb 2020
>  KernelVersion: 5.7
>  Contact:       Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
> -Description:   RO, Contains the the name of HCA the connection established on.
> +Description:   RO, Contains the name of HCA the connection established on.
>
>  What:          /sys/class/rtrs-client/<session-name>/paths/<src@dst>/hca_port
>  Date:          Feb 2020
> diff --git a/Documentation/ABI/testing/sysfs-class-rtrs-server b/Documentation/ABI/testing/sysfs-class-rtrs-server
> index 3b6d5b067df0..b08601d80409 100644
> --- a/Documentation/ABI/testing/sysfs-class-rtrs-server
> +++ b/Documentation/ABI/testing/sysfs-class-rtrs-server
> @@ -24,7 +24,7 @@ What:         /sys/class/rtrs-server/<session-name>/paths/<src@dst>/hca_name
>  Date:          Feb 2020
>  KernelVersion: 5.7
>  Contact:       Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
> -Description:   RO, Contains the the name of HCA the connection established on.
> +Description:   RO, Contains the name of HCA the connection established on.
>
>  What:          /sys/class/rtrs-server/<session-name>/paths/<src@dst>/hca_port
>  Date:          Feb 2020
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD b/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
> index f7b360a61b21..bc44bc903bc8 100644
> --- a/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
> @@ -74,7 +74,7 @@ Description:
>
>                 Reads also cause the AC alarm timer status to be reset.
>
> -               Another way to reset the the status of the AC alarm timer is to
> +               Another way to reset the status of the AC alarm timer is to
>                 write (the number) 0 to this file.
>
>                 If the status return value indicates that the timer has expired,
> diff --git a/Documentation/ABI/testing/sysfs-devices-power b/Documentation/ABI/testing/sysfs-devices-power
> index 1b2a2d41ff80..54195530e97a 100644
> --- a/Documentation/ABI/testing/sysfs-devices-power
> +++ b/Documentation/ABI/testing/sysfs-devices-power
> @@ -303,5 +303,5 @@ Date:               Apr 2010
>  Contact:       Dominik Brodowski <linux@dominikbrodowski.net>
>  Description:
>                 Reports the runtime PM children usage count of a device, or
> -               0 if the the children will be ignored.
> +               0 if the children will be ignored.
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
> index 863cc4897277..57aec11a573f 100644
> --- a/Documentation/ABI/testing/sysfs-driver-ufs
> +++ b/Documentation/ABI/testing/sysfs-driver-ufs
> @@ -983,7 +983,7 @@ Description:        This file shows the amount of data that the host plans to
>  What:          /sys/class/scsi_device/*/device/dyn_cap_needed
>  Date:          February 2018
>  Contact:       Stanislav Nijnikov <stanislav.nijnikov@wdc.com>
> -Description:   This file shows the The amount of physical memory needed
> +Description:   This file shows The amount of physical memory needed
>                 to be removed from the physical memory resources pool of
>                 the particular logical unit. The full information about
>                 the attribute could be found at UFS specifications 2.1.
> diff --git a/Documentation/ABI/testing/sysfs-firmware-acpi b/Documentation/ABI/testing/sysfs-firmware-acpi
> index 819939d858c9..39173375c53a 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-acpi
> +++ b/Documentation/ABI/testing/sysfs-firmware-acpi
> @@ -112,7 +112,7 @@ Description:
>                 OS context.  GPE 0x12, for example, would vector
>                 to a level or edge handler called _L12 or _E12.
>                 The handler may do its business and return.
> -               Or the handler may send send a Notify event
> +               Or the handler may send a Notify event
>                 to a Linux device driver registered on an ACPI device,
>                 such as a battery, or a processor.
>
> --
> 2.25.1
>
