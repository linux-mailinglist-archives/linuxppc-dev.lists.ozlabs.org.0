Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477931728A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 22:42:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbYBg10zHzDvbm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 08:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fLVuTXw5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbY8f5Bn3zDvbh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 08:40:34 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11ALWRbh160883; Wed, 10 Feb 2021 16:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=o6TuZSQpcdPy3WLJuSm6eQE5aim7yVvdU9t1MZ9OKtY=;
 b=fLVuTXw5GB0xrlUk9+oUdcgS4Vi41lMR5mxO36IQgNnpvqXZUxXWqWGdeA0m5zvj2Scq
 +udTAdoJOtISM3SBU9htGICE/uGZMMeAza8AluFqtfMB6Z1KD/2lqwHIVs/Ldt0qVzQy
 6T0qn1V/WUUPT1gqzHKvo8/YQhXm2vVLM1YokVqNYWHUXOT/Doel3iHglMPxEzVmPj1v
 dlLbS2J5sBWqKNlYfhgyBlE8ZY/Ucl8amu08c55zvJ2oiy8PqOPxyXi8g4lPez/Dj9Y3
 os136pOS/Ct+2LPLeGZYnITaB4OQe5LhdP9VRAmEznVx/zQM+omj1OKehdCf+VMC9oD6 Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36mqff0b67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 16:40:08 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11ALWXwH161540;
 Wed, 10 Feb 2021 16:40:07 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36mqff0b4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 16:40:07 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11ALQwK2018691;
 Wed, 10 Feb 2021 21:40:05 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 36hskb2jk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 21:40:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11ALe2Oq42926414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 21:40:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CECA211C05E;
 Wed, 10 Feb 2021 21:40:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2C2111C04A;
 Wed, 10 Feb 2021 21:39:56 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.111.148])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Feb 2021 21:39:56 +0000 (GMT)
Message-ID: <594445d01e085875b97b46be726247f89d1e6661.camel@linux.ibm.com>
Subject: Re: [PATCH v17 00/10] Carry forward IMA measurement log on kexec on
 ARM64
From: Mimi Zohar <zohar@linux.ibm.com>
To: Rob Herring <robh@kernel.org>, Lakshmi Ramasubramanian
 <nramas@linux.microsoft.com>
Date: Wed, 10 Feb 2021 16:39:55 -0500
In-Reply-To: <cf7930239b93044a1be353556b7dc730e024f658.camel@linux.ibm.com>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210210171500.GA2328209@robh.at.kernel.org>
 <5c002c32-bc49-acda-c641-7b1494ea292d@linux.microsoft.com>
 <CAL_JsqLmdqfFF8u=dE+dQz+6ngv=moWkQF8tpZjUCX-vHuvU_w@mail.gmail.com>
 <cf7930239b93044a1be353556b7dc730e024f658.camel@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_10:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102100186
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Paul Mackerras <paulus@samba.org>, vincenzo.frascino@arm.com,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 "AKASHI, Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-02-10 at 15:55 -0500, Mimi Zohar wrote:
> On Wed, 2021-02-10 at 14:42 -0600, Rob Herring wrote:
> > On Wed, Feb 10, 2021 at 11:33 AM Lakshmi Ramasubramanian
> 
> > Ideally, we don't apply the same patch in 2 branches. It looks like
> > there's a conflict but no real dependence on the above patch (the
> > ima_buffer part). The conflict seems trivial enough that Linus can
> > resolve it in the merge window.
> > 
> > Or Mimi can take the whole thing if preferred?
> 
> How about I create a topic branch with just the two patches, allowing
> both of us to merge it?   There shouldn't be a problem with re-writing
> next-integrity history.

The 2 patches are now in the ima-kexec-fixes branch.

Mimi

