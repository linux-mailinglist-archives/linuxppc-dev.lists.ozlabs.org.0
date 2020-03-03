Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80D17863C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 00:22:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XChh0BmyzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 10:22:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=popple.id.au
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XCfp5HXXzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 10:20:34 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 023NJUpp040246
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Mar 2020 18:20:31 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhryctbn6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 18:20:31 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Tue, 3 Mar 2020 23:20:28 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 23:20:26 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 023NKPej52560036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 23:20:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DE74AE04D;
 Tue,  3 Mar 2020 23:20:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2552AE051;
 Tue,  3 Mar 2020 23:20:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Mar 2020 23:20:24 +0000 (GMT)
Received: from townsend.localnet (unknown [9.102.32.146])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E9A98A023A;
 Wed,  4 Mar 2020 10:20:19 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 01/14] powerpc: Enable Prefixed Instructions
Date: Wed, 04 Mar 2020 10:20:23 +1100
In-Reply-To: <1582864874.q013n2u3v1.astroid@bobo.none>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <CACzsE9oQSnEsbD=ftCOd51cPRrDyvv4EHY-1pn+DUUO=AVyTGg@mail.gmail.com>
 <1582864874.q013n2u3v1.astroid@bobo.none>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 20030323-0028-0000-0000-000003E09FCC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030323-0029-0000-0000-000024A5CDCB
Message-Id: <3079586.NPOWFCaNNt@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_08:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1034 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030152
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> But hmm, the dt_cpu_ftrs parsing should be picking those up and setting
> them by default I would think (or maybe not because you don't expect
> FSCR bit if OS support is not required).

Right - the generic dt_cpu_ftrs didn't do the FSCR enablement which I assume 
is because if OS support is required anyway we can just add it in a similar 
way to the below patch. My thinking was that we could use it to disable prefix 
with a firmware if required, however outside of a lab environment there isn't 
much practical use for that so I'm ok with just doing something similar to the 
below.

> All the other FSCR bits are done similarly to this AFAIKS:
> 
>  https://patchwork.ozlabs.org/patch/1244476/
> 
> I would do that for now rather than digging into it too far, but we
> should look at cleaning that up and doing something more like what
> you have here.
>
> >> >  struct dt_cpu_feature_match {
> >> >  
> >> >       const char *name;
> >> >       int (*enable)(struct dt_cpu_feature *f);
> >> > 
> >> > @@ -626,6 +648,7 @@ static struct dt_cpu_feature_match __initdata
> >> > 
> >> >       {"vector-binary128", feat_enable, 0},
> >> >       {"vector-binary16", feat_enable, 0},
> >> >       {"wait-v3", feat_enable, 0},
> >> > 
> >> > +     {"prefix-instructions", feat_enable_prefix, 0},
> >> 
> >> That's reasonable to make that a feature, will it specify a minimum
> >> base set of prefix instructions or just that prefix instructions
> >> with the prefix/suffix arrangement exist?
> > 
> > This was just going to be that they exist.
> > 
> >> You may not need "-instructions" on the end, none of the other
> >> instructions do.
> > 
> > Good point.
> > 
> >> I would maybe just hold off upstreaming the dt_cpu_ftrs changes for
> >> a bit. We have to do a pass over new CPU feature device tree, and
> >> some compatibility questions have come up recently.
> >> 
> >> If you wouldn't mind just adding the new [H]FSCR bits and faults
> >> upstream for now, that would be good.
> > 
> > No problem.
> 
> Thanks,
> Nick




