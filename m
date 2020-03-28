Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E719645A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 09:05:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qB9P3BW1zDqnF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 19:05:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qB7f499wzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 19:03:57 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02S834vw112720
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 04:03:54 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022qvg0ff-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 04:03:54 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Sat, 28 Mar 2020 08:03:48 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 28 Mar 2020 08:03:45 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02S83lPf41812060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 28 Mar 2020 08:03:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55E88AE051;
 Sat, 28 Mar 2020 08:03:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C020CAE04D;
 Sat, 28 Mar 2020 08:03:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.36.249])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 28 Mar 2020 08:03:44 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc xmon: use `dcbf` inplace of `dcbi`
 instruction for 64bit Book3S
From: Balamuruhan S <bala24@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au
Date: Sat, 28 Mar 2020 13:33:43 +0530
In-Reply-To: <9a3c084a-9e86-ff37-111c-6f1a8f0989fc@c-s.fr>
References: <20200326061522.33123-1-bala24@linux.ibm.com>
 <caf285b1-172e-7116-b2ed-3645f36264ed@c-s.fr>
 <a0d623ad8347c6b88ef25c4de1ac5ed736037025.camel@linux.ibm.com>
 <9a3c084a-9e86-ff37-111c-6f1a8f0989fc@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032808-0012-0000-0000-0000039993DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032808-0013-0000-0000-000021D6978A
Message-Id: <fda7ebcce8201e33b984780e7b0a9ebeb70fcbe1.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-28_02:2020-03-27,
 2020-03-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003280070
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-27 at 16:12 +0100, Christophe Leroy wrote:
> 
> Le 27/03/2020 à 10:03, Balamuruhan S a écrit :
> > On Fri, 2020-03-27 at 07:48 +0100, Christophe Leroy wrote:
> > > Le 26/03/2020 à 07:15, Balamuruhan S a écrit :
> > > > Data Cache Block Invalidate (dcbi) instruction was implemented back in
> > > > PowerPC
> > > > architecture version 2.03. It is obsolete and attempt to use of this
> > > > illegal
> > > > instruction results in a hypervisor emulation assistance interrupt. So,
> > > > ifdef
> > > > it out the option `i` in xmon for 64bit Book3S.
> > > 
> > > I don't understand. You say two contradictory things:
> > > 1/ You say it _was_ added back.
> > > 2/ You say it _is_ obsolete.
> > > 
> > > How can it be obsolete if it was added back ?
> > 
> > I actually learnt it from P8 and P9 User Manual,
> > 
> > The POWER8/POWER9 core does not provide support for the following optional
> > or
> > obsolete instructions (attempted use of these results in a hypervisor
> > emulation
> > assistance interrupt):
> > • tlbia - TLB invalidate all
> > • tlbiex - TLB invalidate entry by index (obsolete)
> > • slbiex - SLB invalidate entry by index (obsolete)
> > • dcba - Data cache block allocate (Book II; obsolete)
> > • dcbi - Data cache block invalidate (obsolete)
> > • rfi - Return from interrupt (32-bit; obsolete)
> > 
> 
> Then that's exactly what you have to say in the coming log.

Sure, I will change the commit log in next version along with your suggested
way to ifdef.

> 
> Maybe you could also change invalidate_dcache_range():
> 
> 	for (i = 0; i < size >> shift; i++, addr += bytes) {
> 		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> 			dcbf(addr);
> 		else
> 			dcbi(addr);
> 	}

I will leave this as is based on the discussion.

Thank you Christophe and Segher.

-- Bala
> 
> 
> 
> 
> Christophe

