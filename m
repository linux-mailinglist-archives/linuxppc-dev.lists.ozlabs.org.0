Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8307423D91
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 14:18:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPYQ35x7Vz2yYl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:18:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vAM7yHIB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab+huawei@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vAM7yHIB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPYPP4cVLz2yLq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 23:17:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14D60610A2;
 Wed,  6 Oct 2021 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633522661;
 bh=2a1Cek7SL54JNW45UwH2juSN3LIOBHWjg6H61NYjwVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vAM7yHIB1fUrFXrS0ubihvD97GMbnHBCnAVPGXNul/uhGXP+bHetjxxPPlpfePGyZ
 ulJXQaEO36pMVTYKOx349OdZ0shIsXvEyNoqiP5nRavOvXNBYQLoSrPUpQnAdoW3pO
 FbjshnYvFjMyYAoDX6Xby9EP8xVr0sy6ayj56OvcLlbJpBqYglgijj0LLZEbMvBWQu
 7cNXp3bDbUMyfPSIcWR5hUKz7o1VlgP+kLukiBvnQPRdvtKAD6iGL9gkfdFrUH7uWp
 C093/dHAgBzEgAXIn+4hMRVw+ypQB9XrJNZh6IncYcjfz5MjZO/4vpmdoul8LQgrYw
 X/hyIju3MVAjw==
Date: Wed, 6 Oct 2021 14:17:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sohaib Mohamed <sohaib.amhmd@gmail.com>
Subject: Re: [PATCH] docs: typo fixes in Documentation/ABI/
Message-ID: <20211006141734.3c54893d@sal.lan>
In-Reply-To: <20211006121333.75799-1-sohaib.amhmd@gmail.com>
References: <20211006121333.75799-1-sohaib.amhmd@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Jens Axboe <axboe@kernel.dk>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daejun Park <daejun7.park@samsung.com>, Gioh Kim <gi-oh.kim@ionos.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Can Guo <cang@codeaurora.org>, Avri Altman <avri.altman@wdc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Ilya Dryomov <idryomov@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linuxppc-dev@lists.ozlabs.org,
 Zhang Rui <rui.zhang@intel.com>, linux-kernel@vger.kernel.org,
 Bean Huo <beanhuo@micron.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed,  6 Oct 2021 14:13:25 +0200
Sohaib Mohamed <sohaib.amhmd@gmail.com> escreveu:

> Signed-off-by: Sohaib Mohamed <sohaib.amhmd@gmail.com>

Please add a description for the patch, explaining what typo issues you
fixed. The patch itself looks sane to me.


> ---
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
> @@ -38,7 +38,7 @@ What:		/sys/module/<MODULENAME>/srcversion
>  Date:		Jun 2005
>  Description:
>  		If the module source has MODULE_VERSION, this file will contain
> -		the checksum of the the source code.
> +		the checksum of the source code.
>  
>  What:		/sys/module/<MODULENAME>/version
>  Date:		Jun 2005
> diff --git a/Documentation/ABI/testing/sysfs-bus-rapidio b/Documentation/ABI/testing/sysfs-bus-rapidio
> index f8b6728dac10..9e8fbff99b75 100644
> --- a/Documentation/ABI/testing/sysfs-bus-rapidio
> +++ b/Documentation/ABI/testing/sysfs-bus-rapidio
> @@ -95,7 +95,7 @@ Contact:	Matt Porter <mporter@kernel.crashing.org>,
>  		Alexandre Bounine <alexandre.bounine@idt.com>
>  Description:
>  		(RO) returns name of previous device (switch) on the path to the
> -		device that that owns this attribute
> +		device that owns this attribute
>  
>  What:		/sys/bus/rapidio/devices/<nn>:<d>:<iiii>/modalias
>  Date:		Jul, 2013
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
>  Users:		https://github.com/ibm-capi/libcxl
>  
>  
> diff --git a/Documentation/ABI/testing/sysfs-class-rnbd-client b/Documentation/ABI/testing/sysfs-class-rnbd-client
> index 0b5997ab3365..e6cdc851952c 100644
> --- a/Documentation/ABI/testing/sysfs-class-rnbd-client
> +++ b/Documentation/ABI/testing/sysfs-class-rnbd-client
> @@ -128,6 +128,6 @@ Description:	For each device mapped on the client a new symbolic link is created
>  		The <device_id> of each device is created as follows:
>  
>  		- If the 'device_path' provided during mapping contains slashes ("/"),
> -		  they are replaced by exclamation mark ("!") and used as as the
> +		  they are replaced by exclamation mark ("!") and used as the
>  		  <device_id>. Otherwise, the <device_id> will be the same as the
>  		  "device_path" provided.
> diff --git a/Documentation/ABI/testing/sysfs-class-rtrs-client b/Documentation/ABI/testing/sysfs-class-rtrs-client
> index 49a4157c7bf1..fecc59d1b96f 100644
> --- a/Documentation/ABI/testing/sysfs-class-rtrs-client
> +++ b/Documentation/ABI/testing/sysfs-class-rtrs-client
> @@ -78,7 +78,7 @@ What:		/sys/class/rtrs-client/<session-name>/paths/<src@dst>/hca_name
>  Date:		Feb 2020
>  KernelVersion:	5.7
>  Contact:	Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
> -Description:	RO, Contains the the name of HCA the connection established on.
> +Description:	RO, Contains the name of HCA the connection established on.
>  
>  What:		/sys/class/rtrs-client/<session-name>/paths/<src@dst>/hca_port
>  Date:		Feb 2020
> diff --git a/Documentation/ABI/testing/sysfs-class-rtrs-server b/Documentation/ABI/testing/sysfs-class-rtrs-server
> index 3b6d5b067df0..b08601d80409 100644
> --- a/Documentation/ABI/testing/sysfs-class-rtrs-server
> +++ b/Documentation/ABI/testing/sysfs-class-rtrs-server
> @@ -24,7 +24,7 @@ What:		/sys/class/rtrs-server/<session-name>/paths/<src@dst>/hca_name
>  Date:		Feb 2020
>  KernelVersion:	5.7
>  Contact:	Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
> -Description:	RO, Contains the the name of HCA the connection established on.
> +Description:	RO, Contains the name of HCA the connection established on.
>  
>  What:		/sys/class/rtrs-server/<session-name>/paths/<src@dst>/hca_port
>  Date:		Feb 2020
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD b/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
> index f7b360a61b21..bc44bc903bc8 100644
> --- a/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
> @@ -74,7 +74,7 @@ Description:
>  
>  		Reads also cause the AC alarm timer status to be reset.
>  
> -		Another way to reset the the status of the AC alarm timer is to
> +		Another way to reset the status of the AC alarm timer is to
>  		write (the number) 0 to this file.
>  
>  		If the status return value indicates that the timer has expired,
> diff --git a/Documentation/ABI/testing/sysfs-devices-power b/Documentation/ABI/testing/sysfs-devices-power
> index 1b2a2d41ff80..54195530e97a 100644
> --- a/Documentation/ABI/testing/sysfs-devices-power
> +++ b/Documentation/ABI/testing/sysfs-devices-power
> @@ -303,5 +303,5 @@ Date:		Apr 2010
>  Contact:	Dominik Brodowski <linux@dominikbrodowski.net>
>  Description:
>  		Reports the runtime PM children usage count of a device, or
> -		0 if the the children will be ignored.
> +		0 if the children will be ignored.
>  
> diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
> index 863cc4897277..57aec11a573f 100644
> --- a/Documentation/ABI/testing/sysfs-driver-ufs
> +++ b/Documentation/ABI/testing/sysfs-driver-ufs
> @@ -983,7 +983,7 @@ Description:	This file shows the amount of data that the host plans to
>  What:		/sys/class/scsi_device/*/device/dyn_cap_needed
>  Date:		February 2018
>  Contact:	Stanislav Nijnikov <stanislav.nijnikov@wdc.com>
> -Description:	This file shows the The amount of physical memory needed
> +Description:	This file shows The amount of physical memory needed
>  		to be removed from the physical memory resources pool of
>  		the particular logical unit. The full information about
>  		the attribute could be found at UFS specifications 2.1.
> diff --git a/Documentation/ABI/testing/sysfs-firmware-acpi b/Documentation/ABI/testing/sysfs-firmware-acpi
> index 819939d858c9..39173375c53a 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-acpi
> +++ b/Documentation/ABI/testing/sysfs-firmware-acpi
> @@ -112,7 +112,7 @@ Description:
>  		OS context.  GPE 0x12, for example, would vector
>  		to a level or edge handler called _L12 or _E12.
>  		The handler may do its business and return.
> -		Or the handler may send send a Notify event
> +		Or the handler may send a Notify event
>  		to a Linux device driver registered on an ACPI device,
>  		such as a battery, or a processor.
>  
