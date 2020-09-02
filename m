Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08225A7DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhHPq1X46zDqf6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 18:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RA9h04Gf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhHN56Y2KzDql5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 18:36:21 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0828VZFQ160336; Wed, 2 Sep 2020 04:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=G92Hnl95YGBFYaXfwRX/u5OBkMFB+BAE9YB8vdXBHZ8=;
 b=RA9h04GfqI9EWNcAyotn22fDX6A9FMRDHjAfoAocoiXi/b8U5HuxCPmwMgv8yblS3f2e
 ouADjAfIpySmbm4ZTMX+jb1nJ3/3PSJOJuta07UZjSuQiXIeXsq2m82ctQhEU9JeqPHO
 6pi7I798W7JLRSlmJSnyKxqw76gSCnurm8jpWobd4b1zcE5Hq/IYYHTABZVAOkctnJ+g
 I9kJWVneYIU3V+lBKqSUW1XvR37aZZXULhU+KslWremtubgV6kpA2NrTTOJ+RLPfmxKK
 o7E1/3u8xoUiR14mv/aueVcMLKXSWGR64G7nENJbMgHdwhNLEKAyfPQHkUSiBsgIa1/d UQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a6je2rm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:36:15 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0828XEp5000387;
 Wed, 2 Sep 2020 08:36:13 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 337en9eeey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 08:36:13 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0828aDIV52036084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 08:36:13 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 261D3124058;
 Wed,  2 Sep 2020 08:36:13 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B62D4124052;
 Wed,  2 Sep 2020 08:36:11 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.220.196])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 08:36:11 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 000A72E3027; Wed,  2 Sep 2020 14:05:32 +0530 (IST)
Date: Wed, 2 Sep 2020 14:05:32 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] cpuidle-pseries: Fix CEDE latency conversion from tb to us
Message-ID: <20200902083532.GA14369@in.ibm.com>
References: <1598969293-29228-1-git-send-email-ego@linux.vnet.ibm.com>
 <CACPK8XfZdnKusEuu8i=-aH=Wfr6X6sMrvX=btFq9PtnXJ2w-SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfZdnKusEuu8i=-aH=Wfr6X6sMrvX=btFq9PtnXJ2w-SQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020074
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Joel,

On Wed, Sep 02, 2020 at 01:08:35AM +0000, Joel Stanley wrote:
> On Tue, 1 Sep 2020 at 14:09, Gautham R. Shenoy <ego@linux.vnet.ibm.com> wrote:
> >
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
> > commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> > CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> > of the Extended CEDE states advertised by the platform. The values
> > advertised by the platform are in timebase ticks. However the cpuidle
> > framework requires the latency values in microseconds.
> >
> > If the tb-ticks value advertised by the platform correspond to a value
> > smaller than 1us, during the conversion from tb-ticks to microseconds,
> > in the current code, the result becomes zero. This is incorrect as it
> > puts a CEDE state on par with the snooze state.
> >
> > This patch fixes this by rounding up the result obtained while
> > converting the latency value from tb-ticks to microseconds.
> >
> > Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> > CEDE(0)")
> >
> > Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>

Thanks for reviewing the fix.

> Should you check for the zero case and print a warning?

Yes, that would be better. I will post a v2 with that.

> 
> > ---
> >  drivers/cpuidle/cpuidle-pseries.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> > index ff6d99e..9043358 100644
> > --- a/drivers/cpuidle/cpuidle-pseries.c
> > +++ b/drivers/cpuidle/cpuidle-pseries.c
> > @@ -361,7 +361,7 @@ static void __init fixup_cede0_latency(void)
> >         for (i = 0; i < nr_xcede_records; i++) {
> >                 struct xcede_latency_record *record = &payload->records[i];
> >                 u64 latency_tb = be64_to_cpu(record->latency_ticks);
> > -               u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
> > +               u64 latency_us = DIV_ROUND_UP_ULL(tb_to_ns(latency_tb), NSEC_PER_USEC);
> >
> >                 if (latency_us < min_latency_us)
> >                         min_latency_us = latency_us;
> > --
> > 1.9.4
> >
