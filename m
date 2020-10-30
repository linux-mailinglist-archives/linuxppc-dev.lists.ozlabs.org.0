Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E1529FE10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 07:53:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMtLz4K5CzDqtW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 17:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ASUzYsr9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMswN0sGRzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 17:34:05 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U6XMCn186747; Fri, 30 Oct 2020 02:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=a5fAtWaCtw2lw0dSgLdjA+CSR8i93E5P4UH6V5O3U0U=;
 b=ASUzYsr9w5PpIlo1FB1Ujvp4AT5YXH/OUre7Gkp3TDu90qGcpRmvyPjU0AUUYnRxmqG0
 7vmmN2sP3M7cVc/O+Rda3iOTvpOVji7shv3DHKfGIdcDJXRZZuSMGr6NLUnJbjG+tBFp
 Juc6oDm95+h5SspcMspge/3HT+LWaYZ9I0uL4oB9nGfzicRJ6Wsfl7zvItlgDNcyTWt4
 nnY2QLVyYwMf//UzG7l+fzLLAO4V6HLrUQRGqTEM11EUfSLTfK3Sys6tWbG+1CfiTrPZ
 D3H7tFAQ317lT4utCRZMHCVhNuIYSoO8jmtflcv4DnHKDeKyWHhyzdUDndjk605C6MTD VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fww7sga3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 02:33:46 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09U6XjOW191034;
 Fri, 30 Oct 2020 02:33:45 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fww7sg85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 02:33:45 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U6O1Zv017390;
 Fri, 30 Oct 2020 06:33:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 34f7s3s051-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 06:33:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09U6Xc8235455466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 06:33:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA5E7AE04D;
 Fri, 30 Oct 2020 06:33:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF445AE055;
 Fri, 30 Oct 2020 06:33:04 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.79.209.23])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Oct 2020 06:33:04 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Fri, 30 Oct 2020 12:03:03 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 30/33] docs: ABI: cleanup several ABI documents
In-Reply-To: <95ef2cf3a58f4e50f17d9e58e0d9440ad14d0427.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
 <95ef2cf3a58f4e50f17d9e58e0d9440ad14d0427.1603893146.git.mchehab+huawei@kernel.org>
Date: Fri, 30 Oct 2020 12:03:03 +0530
Message-ID: <87k0v8jk9s.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 spamscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300048
X-Mailman-Approved-At: Fri, 30 Oct 2020 17:51:15 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Peter Chen <peter.chen@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 "Barrat <fbarrat"@linux.ibm.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Hanjun Guo <guohanjun@huawei.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Oleh Kravchenko <oleg@kaa.org.ua>, Thomas Gleixner <tglx@linutronix.de>,
 Kan Liang <kan.liang@linux.intel.com>, Frederic@d06av26.portsmouth.uk.ibm.com,
 Lars-Peter Clausen <lars@metafoo.de>, Bart Van Assche <bvanassche@acm.org>,
 Saravana Kannan <saravanak@google.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Anton Vorontsov <anton@enomsg.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3r?= =?utf-8?Q?ecki?=
 <marmarek@invisiblethingslab.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-acpi@vger.kernel.org, Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Wu Hao <hao.wu@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, linux-media@vger.kernel.org,
 Simon Gaiser <simon@invisiblethingslab.com>, Avri Altman <avri.altman@wdc.com>,
 Dan Murphy <dmurphy@ti.com>, ceph-devel@vger.kernel.org,
 Stefan Achatz <erazor_de@users.sourceforge.net>,
 Konstantin Khlebnikov <koct9i@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Mathieu Malaterre <malat@debian.org>, Jingoo Han <jingoohan1@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Andrew Morton <akpm@linux-foundation.org>, Len Brown <lenb@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> There are some ABI documents that, while they don't generate
> any warnings, they have issues when parsed by get_abi.pl script
> on its output result.
>
> Address them, in order to provide a clean output.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

<snip>
> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
> index c1a67275c43f..8316c33862a0 100644
> --- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
> +++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
> @@ -11,19 +11,26 @@ Description:
>  		at 'Documentation/powerpc/papr_hcalls.rst' . Below are
>  		the flags reported in this sysfs file:
>  
> -		* "not_armed"	: Indicates that NVDIMM contents will not
> +		* "not_armed"
> +				  Indicates that NVDIMM contents will not
>  				  survive a power cycle.
> -		* "flush_fail"	: Indicates that NVDIMM contents
> +		* "flush_fail"
> +				  Indicates that NVDIMM contents
>  				  couldn't be flushed during last
>  				  shut-down event.
> -		* "restore_fail": Indicates that NVDIMM contents
> +		* "restore_fail"
> +				  Indicates that NVDIMM contents
>  				  couldn't be restored during NVDIMM
>  				  initialization.
> -		* "encrypted"	: NVDIMM contents are encrypted.
> -		* "smart_notify": There is health event for the NVDIMM.
> -		* "scrubbed"	: Indicating that contents of the
> +		* "encrypted"
> +				  NVDIMM contents are encrypted.
> +		* "smart_notify"
> +				  There is health event for the NVDIMM.
> +		* "scrubbed"
> +				  Indicating that contents of the
>  				  NVDIMM have been scrubbed.
> -		* "locked"	: Indicating that NVDIMM contents cant
> +		* "locked"
> +				  Indicating that NVDIMM contents cant
>  				  be modified until next power cycle.
>  
>  What:		/sys/bus/nd/devices/nmemX/papr/perf_stats
> @@ -51,4 +58,4 @@ Description:
>  		* "MedWDur " : Media Write Duration
>  		* "CchRHCnt" : Cache Read Hit Count
>  		* "CchWHCnt" : Cache Write Hit Count
> -		* "FastWCnt" : Fast Write Count
> \ No newline at end of file
> +		* "FastWCnt" : Fast Write Count
<snip>

Thanks,

I am fine with proposed changes to sysfs-bus-papr-pmem.

Acked-by: Vaibhav Jain <vaibhav@linux.ibm.com> # for sysfs-bus-papr-pmem

