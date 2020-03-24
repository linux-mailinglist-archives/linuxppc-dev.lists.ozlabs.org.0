Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E175A19059E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 07:17:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mgyH4cYvzDr0R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 17:17:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mgwV25QpzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 17:15:37 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O63RTr064181
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:15:35 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0nkv3v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:15:34 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 24 Mar 2020 06:15:31 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Mar 2020 06:15:28 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02O6EQHe47776212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 06:14:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A4884204F;
 Tue, 24 Mar 2020 06:15:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34ED842052;
 Tue, 24 Mar 2020 06:15:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.41.103])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Mar 2020 06:15:25 +0000 (GMT)
Subject: Re: [PATCH] powerpc xmon: drop the option `i` in cacheflush
From: Balamuruhan S <bala24@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Segher Boessenkool
 <segher@kernel.crashing.org>
Date: Tue, 24 Mar 2020 11:45:24 +0530
In-Reply-To: <87wo7axvd6.fsf@mpe.ellerman.id.au>
References: <20200323112548.1077440-1-bala24@linux.ibm.com>
 <20200323124630.GP22482@gate.crashing.org>
 <1584968594.gguy53jubt.naveen@linux.ibm.com>
 <87wo7axvd6.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032406-0016-0000-0000-000002F6AAFB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032406-0017-0000-0000-0000335A473E
Message-Id: <602778d150d96a165534f49bb0580f315976f2b3.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_01:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=904 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003240030
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 paulus@samba.org, ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-24 at 14:52 +1100, Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> > Segher Boessenkool wrote:
> > > On Mon, Mar 23, 2020 at 04:55:48PM +0530, Balamuruhan S wrote:
> > > > Data Cache Block Invalidate (dcbi) instruction implemented in 32-bit
> > > > designs prior to PowerPC architecture version 2.01 and got obsolete
> > > > from version 2.01.
> 
> We still support 32-bit ...

Okay, got it.

> 
> > > It was added back in 2.03.  It also exists in 64-bit designs (using
> > > category embedded), in 2.07 still even.
> > 
> > Indeed, it has been part of Book3e.
> > 
> > It isn't clear if this is still useful in this context (xmon) though, 
> > since 'dcbf' seems to be equivalent in most respects. At the very least, 
> > we should restrict this to Book3e, if it is of value there.
> 
> Looking at the ISA it looks like dcbf is more or less equivalent and we
> could probably drop the explicit invalidate command.
> 
> But the simplest option is probably to just ifdef it out for
> PPC_BOOK3S_64.

Sure, I will make the changes as suggested.

Thank you!

-- Bala
> 
> cheers

