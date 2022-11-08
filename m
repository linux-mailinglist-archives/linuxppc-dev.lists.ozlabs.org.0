Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 209656208DE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 06:17:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5xDn0P6fz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 16:17:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z3FBGlNO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z3FBGlNO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5xCn5ykkz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 16:16:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A83e6on009609;
	Tue, 8 Nov 2022 05:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ad0m3ckGzVWjBmtCQXVNepPcyj8jZxjOHROq2fP5s5U=;
 b=Z3FBGlNOVf9QOYH8gipMdRbpdTtWz0dGRDnIPrhDQXBcgdvf3yq565H4L7SkU3RA78nQ
 rNlZszCqMG/+aRC1F36lOBxv8wKzZkEPyo9JAYUBT+s1XZxc9R4N42vEDV8XZ6WYZsK/
 RiRzDarX8cKUJB9qn6qsXb5TzoequFsbKd7VWlBFVpb/YuIzYsrl1rDliNqV/hOFxy2J
 69hynJZJ7+EEl2CMCPLQMGfT0zGdojI1rtjqWF+YJ2E0WueSCOA+5kaSNpVgQz0k+AoB
 uWI9Fn3bYaPNQak5nUPe56qAPpaTCduiwssU+uvYsJ1mEj2jxYtaLoHtLiWz32ZVVoao rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqcpve1j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 05:16:24 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A84pURX030986;
	Tue, 8 Nov 2022 05:16:24 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqcpve1hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 05:16:24 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A855coR021945;
	Tue, 8 Nov 2022 05:16:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma01fra.de.ibm.com with ESMTP id 3kngs4jj70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 05:16:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A85GJG66488576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Nov 2022 05:16:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFA2CAE04D;
	Tue,  8 Nov 2022 05:16:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79425AE045;
	Tue,  8 Nov 2022 05:16:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  8 Nov 2022 05:16:19 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0F2C06036F;
	Tue,  8 Nov 2022 16:16:18 +1100 (AEDT)
Message-ID: <bc8b67d94d06122a44fe8a5dfe3d6f20078ffbaf.camel@linux.ibm.com>
Subject: Re: [PATCH v9 6/7] powerpc/code-patching: Use temporary mm for
 Radix MMU
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 08 Nov 2022 16:16:17 +1100
In-Reply-To: <bf8ccc134cfb81a3625afdfe40b8ca5ff08bef30.camel@linux.ibm.com>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
	 <20221025044409.448755-7-bgray@linux.ibm.com>
	 <5c1976e4-8a66-2651-3968-5f23d9cb9bd3@csgroup.eu>
	 <bf8ccc134cfb81a3625afdfe40b8ca5ff08bef30.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i-BnQTMILQBSXjo5wp4_nJh_yi82KEjk
X-Proofpoint-GUID: wbKeury8kLknobv3BYzPvU4EYIPCRU2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080025
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

On Thu, 2022-11-03 at 14:10 +1100, Benjamin Gray wrote:
> On Wed, 2022-11-02 at 10:11 +0000, Christophe Leroy wrote:
> > Le 25/10/2022 =C3=A0 06:44, Benjamin Gray a =C3=A9crit=C2=A0:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * PTE allocation uses GFP=
_KERNEL which means we need to
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * pre-allocate the PTE he=
re because we cannot do the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * allocation during patch=
ing when IRQs are disabled.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pgdp =3D pgd_offset(mm, ad=
dr);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p4dp =3D p4d_alloc(mm, pgd=
p, addr);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON(!p4dp))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto fail_no_p4d;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pudp =3D pud_alloc(mm, p4d=
p, addr);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON(!pudp))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto fail_no_pud;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmdp =3D pmd_alloc(mm, pud=
p, addr);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON(!pmdp))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto fail_no_pmd;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptep =3D pte_alloc_map(mm,=
 pmdp, addr);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON(!ptep))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto fail_no_pte;
> >=20
> > Insn't there standard generic functions to do that ?
> >=20
> > For instance, __get_locked_pte() seems to do more or less the same.
>=20
> __get_locked_pte invokes walk_to_pmd, which leaks memory if the
> allocation fails. This may not be a concern necessarily at boot
> (though
> I still don't like it), but startup is run every time a CPU comes
> online, so the leak is theoretically unbounded.
>=20
> There's no need to leak it in this context, because we know that each
> page is exclusively used by the corresponding patching mm.

I found tlb_gather_mmu() to initialise a struct mmu_gather, so I've
removed all the open coding (it should free any partial page tables if
get_locked_pte fails). Currently running it through CI before posting,
will probably get the v10 out tomorrow.
