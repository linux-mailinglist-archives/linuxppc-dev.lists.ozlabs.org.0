Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF422A3552
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 21:44:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ4fc3957zDqX3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 07:44:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CeaooSde; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPx9b7303zDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 02:07:47 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2F2KcC171448; Mon, 2 Nov 2020 10:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=ej00TIy/LHYCfZ0dOvBL2CZGGwy/uU70D7NYwppsmbI=;
 b=CeaooSde8P9MLJGQKN7VpxuBW/kugZ0Ubk8qYGUGVzkeohHArRsAJfqjFGzuwYnrSWTi
 /ptajn1Z7ZgrR3zZo31N4TxfYQu4DwGZIM9MOdp/Y+Dsb/J7RVxYpG/UlZjrBsr38JMO
 QU2XYT4rgLfb/wu/r4f3NmrOWsd4bjbrs6bQe/3v6mVbSf7UsID1yUh0YKSXWWRY7S5G
 u7rS5ryqq0f4CSoaiy5ymxKzUUuttHCjWDDJlWCNeRqBInxF3obTc89/GHKBGSfpbGvF
 v2/iDtwKFAbGThkzyRZhk+yph3cAassBbG/Fw51NpGogJLBtisfxJdZunU8gGohvdF9x Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34hn6g8qy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 10:06:59 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A2F3Hje180510;
 Mon, 2 Nov 2020 10:06:58 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34hn6g8qx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 10:06:58 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A2EwVLc006665;
 Mon, 2 Nov 2020 15:06:56 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 34h09mnscy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 15:06:56 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A2F6uY712190366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Nov 2020 15:06:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59131B205F;
 Mon,  2 Nov 2020 15:06:56 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6038CB2064;
 Mon,  2 Nov 2020 15:06:55 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.57.175])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Nov 2020 15:06:55 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 06C7A2E323C; Mon,  2 Nov 2020 20:36:52 +0530 (IST)
Date: Mon, 2 Nov 2020 20:36:51 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 20/33] docs: ABI: testing: make the files compatible with
 ReST output
Message-ID: <20201102150651.GA4379@in.ibm.com>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
 <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_09:2020-11-02,
 2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020116
X-Mailman-Approved-At: Tue, 03 Nov 2020 07:37:59 +1100
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
Reply-To: ego@linux.vnet.ibm.com
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Petr Mladek <pmladek@suse.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Sebastian Reichel <sre@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Bruno Meneguele <bmeneg@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 Oleh Kravchenko <oleg@kaa.org.ua>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier@javigon.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-acpi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Len Brown <lenb@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Baolin Wang <baolin.wang7@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Dan Murphy <dmurphy@ti.com>,
 Orson Zhai <orsonzhai@gmail.com>, Philippe Bergheaud <felix@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Konstantin Khlebnikov <koct9i@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Leonid Maksymchuk <leonmaxx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 03:23:18PM +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> 
> Some files over there won't parse well by Sphinx.
> 

[..snip..]



> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index b555df825447..274c337ec6a9 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -151,23 +151,28 @@ Description:
>  		The processor idle states which are available for use have the
>  		following attributes:
> 
> -		name: (RO) Name of the idle state (string).
> +		======== ==== =================================================
> +		name:	 (RO) Name of the idle state (string).
> 
>  		latency: (RO) The latency to exit out of this idle state (in
> -		microseconds).
> +			      microseconds).
> 
> -		power: (RO) The power consumed while in this idle state (in
> -		milliwatts).
> +		power:   (RO) The power consumed while in this idle state (in
> +			      milliwatts).
> 
> -		time: (RO) The total time spent in this idle state (in microseconds).
> +		time:    (RO) The total time spent in this idle state
> +			      (in microseconds).
> 
> -		usage: (RO) Number of times this state was entered (a count).
> +		usage:	 (RO) Number of times this state was entered (a count).
> 
> -		above: (RO) Number of times this state was entered, but the
> -		       observed CPU idle duration was too short for it (a count).
> +		above:	 (RO) Number of times this state was entered, but the
> +			      observed CPU idle duration was too short for it
> +			      (a count).
> 
> -		below: (RO) Number of times this state was entered, but the
> -		       observed CPU idle duration was too long for it (a count).
> +		below: 	 (RO) Number of times this state was entered, but the
> +			      observed CPU idle duration was too long for it
> +			      (a count).
> +		======== ==== =================================================
> 
>  What:		/sys/devices/system/cpu/cpuX/cpuidle/stateN/desc
>  Date:		February 2008
> @@ -290,6 +295,7 @@ Description:	Processor frequency boosting control
>  		This switch controls the boost setting for the whole system.
>  		Boosting allows the CPU and the firmware to run at a frequency
>  		beyound it's nominal limit.
> +
>  		More details can be found in
>  		Documentation/admin-guide/pm/cpufreq.rst
> 

The changes to cpuidle states look good to me.


[..snip..]

> @@ -414,30 +434,30 @@ Description:	POWERNV CPUFreq driver's frequency throttle stats directory and
>  		throttle attributes exported in the 'throttle_stats' directory:
> 
>  		- turbo_stat : This file gives the total number of times the max
> -		frequency is throttled to lower frequency in turbo (at and above
> -		nominal frequency) range of frequencies.
> +		  frequency is throttled to lower frequency in turbo (at and above
> +		  nominal frequency) range of frequencies.
> 
>  		- sub_turbo_stat : This file gives the total number of times the
> -		max frequency is throttled to lower frequency in sub-turbo(below
> -		nominal frequency) range of frequencies.
> +		  max frequency is throttled to lower frequency in sub-turbo(below
> +		  nominal frequency) range of frequencies.
> 
>  		- unthrottle : This file gives the total number of times the max
> -		frequency is unthrottled after being throttled.
> +		  frequency is unthrottled after being throttled.
> 
>  		- powercap : This file gives the total number of times the max
> -		frequency is throttled due to 'Power Capping'.
> +		  frequency is throttled due to 'Power Capping'.
> 
>  		- overtemp : This file gives the total number of times the max
> -		frequency is throttled due to 'CPU Over Temperature'.
> +		  frequency is throttled due to 'CPU Over Temperature'.
> 
>  		- supply_fault : This file gives the total number of times the
> -		max frequency is throttled due to 'Power Supply Failure'.
> +		  max frequency is throttled due to 'Power Supply Failure'.
> 
>  		- overcurrent : This file gives the total number of times the
> -		max frequency is throttled due to 'Overcurrent'.
> +		  max frequency is throttled due to 'Overcurrent'.
> 
>  		- occ_reset : This file gives the total number of times the max
> -		frequency is throttled due to 'OCC Reset'.
> +		  frequency is throttled due to 'OCC Reset'.
> 
>  		The sysfs attributes representing different throttle reasons like
>  		powercap, overtemp, supply_fault, overcurrent and occ_reset map to


This hunk for the powernv cpufreq driver looks good to me.
For these two hunks,

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>


