Return-Path: <linuxppc-dev+bounces-14557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B27C97313
	for <lists+linuxppc-dev@lfdr.de>; Mon, 01 Dec 2025 13:16:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKjZ070TSz2yvD;
	Mon, 01 Dec 2025 23:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764591400;
	cv=none; b=NxnpXpsQBHwAch2OK1jKWPd7CsORJxBHk0Hf6KS/zg/A0qXy/ZWTWYhoCuJ0xAa2LQ9SLDIudDZO4e2lBS+Job/yaa+tVfPTq0z+luEzKGNrdTFiyb3k8PCBhiQ0WRQuAO3AHXwPKA5T/t/ss5di67tP8RhdwY1OfFXJ0XL/u4/15UcOuLuI1iKT44hQ7DWz4kz6q+K/ALJOrw4rFkTAUARa+MfP3H3dAuQK/VF2ODC1NPFAmWsiHwIejkxQQNYGZyzXwFBPSS4gfOyXg74LovuZ4YqPrWjGp1GT6ZaHvC06gge2T+pJQ74skyCoxu/Ea8+0BYTN7MvIC2oQwO304g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764591400; c=relaxed/relaxed;
	bh=CvzUt5RPAqT5bwAL9q2UFTk5c6O8i8Nt+LMRpAZzjTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgYS3JtI6SCh6R0OSSfNCVLULIfpMzery+yt+rYuJuK3hYQYtWY8tk77TfQgLQdXeWIsuuFKeb1nkMYOBGkreShPWk26IMzagJifzdYk6NRhGkKR+o4uQ20GTSBQ9r3GNNu6yVUf0JLqe3X4+SiRipvn5I2Ib/acahKzy5b1DtDqb4sWCq7U+peE/Hcp9vnJHf6M/An8kODXaTpgFku9lkvl3O59ADQrLdX37WA+GBVknxll8quPfiI/CoU9SemxkXH3oEuKOtb3a5SvM7DyVx82gThHS8ThAdyz4RG9SIFN7hqMgbL2lVoxL5YZBXNdwnZtF3qZFwlp4rzy/uPKlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RfcdWgwn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RfcdWgwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKjYz3kxqz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Dec 2025 23:16:38 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B1BilaR001393;
	Mon, 1 Dec 2025 12:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=CvzUt5RPAqT5bwAL9q2UF
	Tk5c6O8i8Nt+LMRpAZzjTY=; b=RfcdWgwnrBkgX4PRtI+vM3BZOU/oisDfAd1RG
	P/Pd1ujTSy7FjsVrNmovH1Ci6pshxOUFngfsuTSj/2G+ifLeYhi0OVttWBXw72kk
	0J+rtL1FBbYhvehN3Fts64LBjqKWsX7KwogLNyCClmFSNm0FTRX+7bKhLShSoJv3
	a+z9rGB7hBrLH0ZgjzoccRAI7CeRyvbmDi/rjb9wbpF/aSIukKi8RiEhk+QwoSl0
	cni+KhzpM4KgQFLx5dQ2ztbtMzKQ7FMjXpX6WCYUQmnuF7nM4eMnMN4jmPScZyIr
	jAhtlkoGEXB+VIiJvTg5MHvwYYynD+qDDo++DvfFUqCvn6GuQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8uexbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 12:15:48 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B1CC6En015611;
	Mon, 1 Dec 2025 12:15:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8uexbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 12:15:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B1C1NiQ024080;
	Mon, 1 Dec 2025 12:15:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5s6evw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 12:15:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B1CFfZ923724366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Dec 2025 12:15:41 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75D162004D;
	Mon,  1 Dec 2025 12:15:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48EBE20043;
	Mon,  1 Dec 2025 12:15:38 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon,  1 Dec 2025 12:15:38 +0000 (GMT)
Date: Mon, 1 Dec 2025 17:45:37 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v2 2/2] powerpc/smp: Disable steal from updating CPU
 capacity
Message-ID: <aS2G6XDdGse5RYw5@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20251029060757.2007601-1-srikar@linux.ibm.com>
 <20251029060757.2007601-2-srikar@linux.ibm.com>
 <CAKfTPtDW9rApEm+4qSrEpRDMA+68BnVOgegKUZUa5S-gKnR--A@mail.gmail.com>
 <aQHQ7UyaK849BKV8@linux.ibm.com>
 <CAKfTPtDtfy7=rb6rPVMAk1+Bq4w=+opiWuo_Y+3dy3me--6KsA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAKfTPtDtfy7=rb6rPVMAk1+Bq4w=+opiWuo_Y+3dy3me--6KsA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HNs7Y5ATDJRfXHPva5QLC9S__2RJjgkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfX+gGdOfJ1Z5UN
 ADdMqsTzCZijIQNCIDpG4gGmLZB8KPoGYXEJgYBCCMlJFDpxgCrBTk/grWwIpLMRaWz7a8Cu4mN
 qpo4Y3gQIETv4OtvHmHyTm14xTlZyBIEjBl01cmq7fFy/UItJBaSRijspyjm6bMstk606Shoujv
 ivTfsYRrETS3fUHDHe0c35Qq4+FfKtFkOGm49kC9ujO1mUtr7fBjERjAbgkNoyanmXJAkVs/wQC
 mrCP1KLRKQMoqpXIkyjv9X8gZWYXtEoGBMrukewJjU8NNQYk2z8dT7sC6v8JppHM/MMUGANbSte
 x0tvVs8S0Pb8wXqgI+TT5zL17lVpkBKr2CmYPDI+3Lo1g7RQM9x1WkIclv7oXTOWehEX+mq83Hi
 xTcrBKwCxNx89zUh2IYhiBdq2JJZ9w==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=692d86f4 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VnNF1IyMAAAA:8 a=aOk6NyUQ4sEGh1re8dIA:9 a=wPNLvfGTeEIA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jmidmTeuBNEF7zmVGgWupDBfbwogCPbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Vincent Guittot <vincent.guittot@linaro.org> [2025-11-03 09:46:26]:

> Hi Sikar,
> 
> On Wed, 29 Oct 2025 at 09:32, Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> >
> > * Vincent Guittot <vincent.guittot@linaro.org> [2025-10-29 08:43:34]:
> >
> > > Hi Srikar,
> > >
> > > On Wed, 29 Oct 2025 at 07:09, Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> > > >
> > > > In a shared LPAR with SMT enabled, it has been observed that when a CPU
> > > > experiences steal time, it can trigger task migrations between sibling
> > > > CPUs. The idle CPU pulls a runnable task from its sibling that is
> > > > impacted by steal, making the previously busy CPU go idle. This reversal
> > >
> > > IIUC, the migration is triggered by the reduced capacity case when
> > > there is 1 task on the CPU

Hi Peter, Vincent

Do you have any more inputs on this?
If not can this pulled into the scheduler code.

--
Thanks and Regards
Srikar Dronamraju

