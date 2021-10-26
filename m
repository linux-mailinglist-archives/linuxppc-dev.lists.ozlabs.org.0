Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A03843B2EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 15:09:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdsbs6n5Fz3036
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 00:09:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NGtmOg2G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NGtmOg2G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdsb46rN6z2yLm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 00:08:48 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QCH26B025394; 
 Tue, 26 Oct 2021 13:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/xKjX7zeq971INJvr0YNpESJxm9aAQToNy2FujCIzE4=;
 b=NGtmOg2G+ZIp4mWj40sNUXExjKP4CmvUvmSl7oSGcMcBV50q0TFbQCV68XwILo2m0M1m
 G3raEkGL2egiV7XfPWJRkz1nVBppzBRZ78fbN5SWDA+f4aIyiUwvng/v5Ix+rpN8Toxu
 OznP/t+hlpqLKnC9KPQv8YBZAwvqgHCinG8kGxoIzAp+bCw6SaVJWw3cIXb4wpqn47p8
 14quNNzNwT6F2hchPhzXgbZBfsYV1YFk46KcyUYK9DI3ROuGegw7MYU70ZV0HogePkFQ
 Ky7uEp6tKEs0KgBcnIa+33ngHb0rv71CAPXND93OI00VSnviYKgf0vYTDX2hJPPe6t33 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bx596x846-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 13:08:40 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QBkR4R021388;
 Tue, 26 Oct 2021 13:08:40 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bx596x83n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 13:08:40 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QCvlDX011481;
 Tue, 26 Oct 2021 13:08:39 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3bx4efbupq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 13:08:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QD8cfv48693634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 13:08:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98FEEBE05A;
 Tue, 26 Oct 2021 13:08:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E031BE065;
 Tue, 26 Oct 2021 13:08:38 +0000 (GMT)
Received: from localhost (unknown [9.211.49.177])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Oct 2021 13:08:38 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Hill Ma <maahiuzeon@gmail.com>
Subject: Re: [PATCH v2] macintosh/via-pmu-led: make disk activity usage a
 parameter.
In-Reply-To: <20211026033254.1052-1-maahiuzeon@gmail.com>
References: <20211026033254.1052-1-maahiuzeon@gmail.com>
Date: Tue, 26 Oct 2021 08:08:38 -0500
Message-ID: <87fssox7ah.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6aO6ediL6HTYrQHIwSlnY5kSvANXx6ix
X-Proofpoint-GUID: 0Jj02Gc0AyomDLd7w1-3ui-6PXWErbaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_02,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260076
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Hill Ma <maahiuzeon@gmail.com> writes:
> Whether to use the LED as a disk activity is a user preference.
> Some like this usage while others find the LED too bright. So it
> might be a good idea to make this choice a runtime parameter rather
> than compile-time config.

Users already have the ability to change the LED behavior at runtime
already, correct? I.e. they can do:

  echo none > /sys/class/leds/pmu-led::front/trigger

in their boot scripts. Granted, a kernel built with ADB_PMU_LED_DISK=y
will blink the LED on disk activity until user space is running. Is this
unsatisfactory?

> The default is set to disabled as OS X does not use the LED as a
> disk activity indicator.

This is long-standing behavior in Linux and OS X has been EOL on this
architecture for a decade, so this isn't much of a consideration at this
point. Seems more important to avoid surprising existing users and
distributions with a behavior change that makes additional work for
them. See below.

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 43dc35fe5bc0..a656a51ba0a8 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -250,6 +250,12 @@
>  			Use timer override. For some broken Nvidia NF5 boards
>  			that require a timer override, but don't have HPET
>  
> +	adb_pmu_led_disk [PPC]
> +			Use front LED as disk LED by default. Only applies to
> +			PowerBook, iBook, PowerMac 7,2/7,3.
> +			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
> +			Default: disabled
> +
>  	add_efi_memmap	[EFI; X86] Include EFI memory map in
>  			kernel's map of available physical RAM.
>  
> diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> index 5cdc361da37c..243215de563c 100644
> --- a/drivers/macintosh/Kconfig
> +++ b/drivers/macintosh/Kconfig
> @@ -78,16 +78,6 @@ config ADB_PMU_LED
>  	  behaviour of the old CONFIG_BLK_DEV_IDE_PMAC_BLINK, select this
>  	  and the disk LED trigger and configure appropriately through sysfs.
>  
> -config ADB_PMU_LED_DISK
> -	bool "Use front LED as DISK LED by default"
> -	depends on ADB_PMU_LED
> -	depends on LEDS_CLASS
> -	select LEDS_TRIGGERS
> -	select LEDS_TRIGGER_DISK
> -	help
> -	  This option makes the front LED default to the disk trigger
> -	  so that it blinks on disk activity.
> -

So, if I've been relying on CONFIG_ADB_PMU_LED_DISK=y and I upgrade to a
newer kernel with the proposed change, from my point of view the disk
activity LED has stopped working and I need to alter the bootloader
config or init scripts to restore the expected behavior. That seems
undesirable to me.

I don't think we rigidly enforce Kconfig backward compatibility, but
when it comes to a user-visible function on a legacy platform where
users and distros likely have their configurations figured out already,
it's probably best to avoid such changes.
