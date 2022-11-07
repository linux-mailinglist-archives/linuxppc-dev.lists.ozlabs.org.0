Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44F61EB40
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 07:59:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5MYM3k4vz3cGP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 17:59:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EwY8bJ3L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EwY8bJ3L;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5MXM3Dszz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 17:58:58 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A75l1Fn014382;
	Mon, 7 Nov 2022 06:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=V6m6ie/gOhDGYDEwpDQhkrjFJ7O4YKUNPj3i3MSXORM=;
 b=EwY8bJ3LgnZIzYxrBdzylBQ1+G047sZbZ3jV+gFQ1Qu335QPG2D7fMF2L9LtX5DAyMaY
 E7EVzgJCUP+qDMd8DpS7gn/2r9FoWLOi7x8JhFyrnYQN89o8+AfpG9xblIj38ux4yOd0
 raKoF+FiU4ghzdAEYdKIkVNb/78/j92at5gA28C1zMXbl7NLwC7dEfbMhZgEEM5ZhA7T
 l3QxiKA8GbdceVqTBCNJl/9NVFYyWqvRxOe3BC7vXdZJFUZkEHjYJXo0ZE0JHCk6I7yY
 G4m0YhEfBORjSMj6NuVMMYQ30kZk/PjlkpM1lymqbg+Lyx68Z6TpOUpZBELYgeg8zFs9 kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1w809gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 06:58:46 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A76iTdj015741;
	Mon, 7 Nov 2022 06:58:45 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1w809fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 06:58:45 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A76odfr029145;
	Mon, 7 Nov 2022 06:58:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3kngp5hhqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 06:58:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A76wfFV51904800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 06:58:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BE1B52050;
	Mon,  7 Nov 2022 06:58:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 063AD5204F;
	Mon,  7 Nov 2022 06:58:41 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (unknown [9.177.18.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DD3D660257;
	Mon,  7 Nov 2022 17:58:32 +1100 (AEDT)
Message-ID: <cd76d514a59088706721bbd3817b0ae664751acc.camel@linux.ibm.com>
Subject: Re: [PATCH v9 5/7] powerpc/tlb: Add local flush for page given
 mm_struct and psize
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 07 Nov 2022 17:58:25 +1100
In-Reply-To: <b2d1c870311672650798c0e7eee5532b505a0176.camel@linux.ibm.com>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
	 <20221025044409.448755-6-bgray@linux.ibm.com>
	 <6c13afb6-3b58-f673-a396-1ae80931b80b@csgroup.eu>
	 <b2d1c870311672650798c0e7eee5532b505a0176.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iCQ3hThVAsa92d9AKKxDHSLdmx869RRQ
X-Proofpoint-ORIG-GUID: 8XU7Wjb_thJZv9P8YAj42WuPmbdr7qnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=938 adultscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211070055
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-11-03 at 11:39 +1100, Benjamin Gray wrote:
> On Wed, 2022-11-02 at 09:56 +0000, Christophe Leroy wrote:
> > By the way, 'extern' keyword is pointless and deprecated for
> > functions=20
> > prototypes, please don't add new ones, even if other historical=20
> > prototypes have one.
>=20
> This and the above commented parts match the style of the surrounding
> implementations. For example,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0static inline void local_=
flush_tlb_mm(struct mm_struct *mm)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret=
urn radix__local_flush_tlb_mm(mm);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return hash__local_flush_tlb_mm(mm);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> I am not going to add code that is inconsistent with the surrounding
> code. That just causes confusion later down the line when readers
> wonder why this function is special compared to the others. If it
> needs
> to use modern style, then I would be happy to include a patch that
> modernises the surrounding code first.
>=20
> Though why the hash__* functions are empty I'm not sure... If they
> were
> not implemented I would have expected a BUILD_BUG(). If they are
> unnecessary due to hash itself, it's odd that they exist (as you
> point
> out for the new one).

From what I can see in the history, the empty hash functions were
originally introduced as 64-bit compatibility definitions for the hash
MMU (which I guess doesn't require any action). These empty functions
were shuffled around, then eventually prefixed with hash__* to make way
for the radix variants, which are hidden behind a generic
'local_flush_tlb_mm' etc. implementation as we see today. So basically,
the empty hash__* functions no longer (never, really) served a purpose
once the generic wrapper was added. I'll add a patch to delete them and
clean up the return voids.
