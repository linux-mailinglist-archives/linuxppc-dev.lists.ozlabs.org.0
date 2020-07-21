Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC6228753
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 19:28:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB5Cy1WWkzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 03:28:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB59b65WJzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 03:26:27 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LH1Ll9096868; Tue, 21 Jul 2020 13:26:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vgp1g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 13:26:23 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LH2TEk101896;
 Tue, 21 Jul 2020 13:26:22 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vgp1fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 13:26:22 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LHP8wV023979;
 Tue, 21 Jul 2020 17:26:21 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7m4ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 17:26:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LHQIDa58916972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 17:26:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1380842045;
 Tue, 21 Jul 2020 17:26:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9DC042041;
 Tue, 21 Jul 2020 17:26:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.207.143])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 17:26:16 +0000 (GMT)
Message-ID: <1595352376.5311.8.camel@linux.ibm.com>
Subject: Re: [PATCH v6] ima: move APPRAISE_BOOTPARAM dependency on
 ARCH_POLICY to runtime
From: Mimi Zohar <zohar@linux.ibm.com>
To: Bruno Meneguele <bmeneg@redhat.com>
Date: Tue, 21 Jul 2020 13:26:16 -0400
In-Reply-To: <20200720153841.GG10323@glitch>
References: <20200713164830.101165-1-bmeneg@redhat.com>
 <d337cbba-e996-e898-1e75-9f142d480e5e@linux.vnet.ibm.com>
 <1595257015.5055.8.camel@linux.ibm.com> <20200720153841.GG10323@glitch>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_09:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210114
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
Cc: linux-s390@vger.kernel.org, Nayna <nayna@linux.vnet.ibm.com>,
 erichte@linux.ibm.com, nayna@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-07-20 at 12:38 -0300, Bruno Meneguele wrote:
> On Mon, Jul 20, 2020 at 10:56:55AM -0400, Mimi Zohar wrote:
> > On Mon, 2020-07-20 at 10:40 -0400, Nayna wrote:
> > > On 7/13/20 12:48 PM, Bruno Meneguele wrote:
> > > > The IMA_APPRAISE_BOOTPARAM config allows enabling different "ima_appraise="
> > > > modes - log, fix, enforce - at run time, but not when IMA architecture
> > > > specific policies are enabled.  This prevents properly labeling the
> > > > filesystem on systems where secure boot is supported, but not enabled on the
> > > > platform.  Only when secure boot is actually enabled should these IMA
> > > > appraise modes be disabled.
> > > >
> > > > This patch removes the compile time dependency and makes it a runtime
> > > > decision, based on the secure boot state of that platform.
> > > >
> > > > Test results as follows:
> > > >
> > > > -> x86-64 with secure boot enabled
> > > >
> > > > [    0.015637] Kernel command line: <...> ima_policy=appraise_tcb ima_appraise=fix
> > > > [    0.015668] ima: Secure boot enabled: ignoring ima_appraise=fix boot parameter option
> > > >
> > 
> > Is it common to have two colons in the same line?  Is the colon being
> > used as a delimiter when parsing the kernel logs?  Should the second
> > colon be replaced with a hyphen?  (No need to repost.  I'll fix it
> > up.)
> >  
> 
> AFAICS it has been used without any limitations, e.g:
> 
> PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
> microcode: CPU0: patch_level=0x08701013
> Lockdown: modprobe: unsigned module loading is restricted; see man kernel_lockdown.7
> ...
> 
> I'd say we're fine using it.

Ok.  FYI, it's now in next-integrity.

Mimi
