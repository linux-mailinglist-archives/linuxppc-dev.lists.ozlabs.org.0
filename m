Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F7F1F06C2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 15:27:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fL131BXPzDqwD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 23:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49fHDL5RkhzDqxD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 21:22:26 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 056B1KJP149205; Sat, 6 Jun 2020 07:21:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g42qq2d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jun 2020 07:21:51 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 056BClkk177079;
 Sat, 6 Jun 2020 07:21:50 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g42qq2cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jun 2020 07:21:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 056BF2Od015969;
 Sat, 6 Jun 2020 11:21:49 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 31g2s7rj7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jun 2020 11:21:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 056BLkna67043406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 6 Jun 2020 11:21:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3934A4060;
 Sat,  6 Jun 2020 11:21:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D48F4A4054;
 Sat,  6 Jun 2020 11:21:42 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.89.98])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  6 Jun 2020 11:21:42 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Sat, 06 Jun 2020 16:51:41 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH v10 4/6] powerpc/papr_scm: Improve error logging and
 handling papr_scm_ndctl()
In-Reply-To: <CAPcyv4g2x7LV3ARRj-RBS1K84WNayr9oDcupzPQ1gtK1A_e+aQ@mail.gmail.com>
References: <20200604234136.253703-1-vaibhav@linux.ibm.com>
 <20200604234136.253703-5-vaibhav@linux.ibm.com>
 <20200605171313.GO1505637@iweiny-DESK2.sc.intel.com>
 <CAPcyv4g2x7LV3ARRj-RBS1K84WNayr9oDcupzPQ1gtK1A_e+aQ@mail.gmail.com>
Date: Sat, 06 Jun 2020 16:51:41 +0530
Message-ID: <87zh9gfni2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-06_06:2020-06-04,
 2020-06-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=1 cotscore=-2147483648 lowpriorityscore=0
 adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006060084
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ira and Dan,

Thanks for reviewing this patch. Have updated the patch based on your
feedback to upadate cmd_rc only when the nd_cmd was handled and return
'0' in that case.

Other errors in case the nd_cmd was unrecognized or invalid result in
error returned from this functions as you suggested.

~ Vaibhav

Dan Williams <dan.j.williams@intel.com> writes:

> On Fri, Jun 5, 2020 at 10:13 AM Ira Weiny <ira.weiny@intel.com> wrote:
>>
>> On Fri, Jun 05, 2020 at 05:11:34AM +0530, Vaibhav Jain wrote:
>> > Since papr_scm_ndctl() can be called from outside papr_scm, its
>> > exposed to the possibility of receiving NULL as value of 'cmd_rc'
>> > argument. This patch updates papr_scm_ndctl() to protect against such
>> > possibility by assigning it pointer to a local variable in case cmd_rc
>> > == NULL.
>> >
>> > Finally the patch also updates the 'default' clause of the switch-case
>> > block removing a 'return' statement thereby ensuring that value of
>> > 'cmd_rc' is always logged when papr_scm_ndctl() returns.
>> >
>> > Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
>> > Cc: Dan Williams <dan.j.williams@intel.com>
>> > Cc: Michael Ellerman <mpe@ellerman.id.au>
>> > Cc: Ira Weiny <ira.weiny@intel.com>
>> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> > ---
>> > Changelog:
>> >
>> > v9..v10
>> > * New patch in the series
>>
>> Thanks for making this a separate patch it is easier to see what is going on
>> here.
>>
>> > ---
>> >  arch/powerpc/platforms/pseries/papr_scm.c | 10 ++++++++--
>> >  1 file changed, 8 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> > index 0c091622b15e..6512fe6a2874 100644
>> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> > @@ -355,11 +355,16 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>> >  {
>> >       struct nd_cmd_get_config_size *get_size_hdr;
>> >       struct papr_scm_priv *p;
>> > +     int rc;
>> >
>> >       /* Only dimm-specific calls are supported atm */
>> >       if (!nvdimm)
>> >               return -EINVAL;
>> >
>> > +     /* Use a local variable in case cmd_rc pointer is NULL */
>> > +     if (!cmd_rc)
>> > +             cmd_rc = &rc;
>> > +
>>
>> This protects you from the NULL.  However...
>>
>> >       p = nvdimm_provider_data(nvdimm);
>> >
>> >       switch (cmd) {
>> > @@ -381,12 +386,13 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>> >               break;
>> >
>> >       default:
>> > -             return -EINVAL;
>> > +             dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
>> > +             *cmd_rc = -EINVAL;
>>
>> ... I think you are conflating rc and cmd_rc...
>>
>> >       }
>> >
>> >       dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
>> >
>> > -     return 0;
>> > +     return *cmd_rc;
>>
>> ... this changes the behavior of the current commands.  Now if the underlying
>> papr_scm_meta_[get|set]() fails you return that failure as rc rather than 0.
>>
>> Is that ok?
>
> The expectation is that rc is "did the command get sent to the device,
> or did it fail for 'transport' reasons". The role of cmd_rc is to
> translate the specific status response of the command into a common
> error code. The expectations are:

>
> rc < 0: Error code, Linux terminated the ioctl before talking to hardware
>
> rc == 0: Linux successfully submitted the command to hardware, cmd_rc
> is valid for command specific response
>
> rc > 0: Linux successfully submitted the command, but detected that
> only a subset of the data was accepted for "write"-style commands, or
> that only subset of data was returned for "read"-style commands. I.e.
> short-write / short-read semantics. cmd_rc is valid in this case and
> its up to userspace to determine if a short transfer is an error or
> not.
>
>> Also 'logging cmd_rc' in the invalid cmd case does not seem quite right unless
>> you really want rc to be cmd_rc.
>>
>> The architecture is designed to separate errors which occur in the kernel vs
>> errors in the firmware/dimm.  Are they always the same?  The current code
>> differentiates them.
>
> Yeah, they're distinct, transport vs end-point / command-specific
> status returns.


-- 
Cheers
~ Vaibhav
