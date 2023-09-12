Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A1D79D978
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:23:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b+rGIeot;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlYQf1nb6z3dHf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 05:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b+rGIeot;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlYPj0YcNz3dGS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 05:22:32 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CJKReI027902;
	Tue, 12 Sep 2023 19:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=wWnLfUaBsk8/9XZq7ZQH7mewYkodHLrDkdq6gKH9nHs=;
 b=b+rGIeotYwJ5mm+tN5Cg3Mvkl+ATz7Iwb3w7/mN+KOnolFN67Z3rNdqMH6TebkCJms/D
 juB77jj9kdSVl8cQORe+9OacFjlBnRTWD/W2vwnlwsQ2jmOXEo+vhEaDv+h4fbgae2FL
 KojfLqUQ4L6uc78RWLDMdwTDnmjZJSofYqK41V3DS+rMq2Bm15ImsVLVCoacAp8+A0Uc
 4QFyDgMtGExEkiHg0vmVAiPdCBJuQk8v1WecfWt3k4hj1nYk1eO5jDmkWbl1JR2CIZqM
 0Q42ej1ks0lqYnOQsSs5FOM3UC/UIbaXAlzmSviuQPTU1R+SmRkd19m5tgPn/rX9twco hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2x24r0xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:22:24 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38CJLjsN032516;
	Tue, 12 Sep 2023 19:22:24 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2x24r0xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:22:24 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38CIOmoM002779;
	Tue, 12 Sep 2023 19:22:23 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t14hkweur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:22:23 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38CJMMEN41353628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 19:22:22 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42AC758059;
	Tue, 12 Sep 2023 19:22:22 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E074058058;
	Tue, 12 Sep 2023 19:22:20 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.watson.ibm.com (unknown [9.31.99.213])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Sep 2023 19:22:20 +0000 (GMT)
Message-ID: <afba92bc2961c758d34ab340de207beb0a3b84b0.camel@linux.ibm.com>
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
From: Mimi Zohar <zohar@linux.ibm.com>
To: Jarkko Sakkinen <jarkko@kernel.org>,
        Michal =?ISO-8859-1?Q?Such=E1nek?=
	 <msuchanek@suse.de>,
        Nayna <nayna@linux.vnet.ibm.com>
Date: Tue, 12 Sep 2023 15:22:20 -0400
In-Reply-To: <CVGUFUEQVCHS.37OA20PNG9EVB@suppilovahvero>
References: <20230907165224.32256-1-msuchanek@suse.de>
	 <20230907173232.GD8826@kitsune.suse.cz>
	 <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
	 <20230912074116.GL8826@kitsune.suse.cz>
	 <CVGUFUEQVCHS.37OA20PNG9EVB@suppilovahvero>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3IPyqn1Wmos6pu4cDwBz0Ld8z88iSZJL
X-Proofpoint-ORIG-GUID: Hba6BnrVByWDG4ASRxD3uNw2IT8kyZ52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=997
 phishscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309120160
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, joeyli <jlee@suse.com>, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-09-12 at 12:49 +0300, Jarkko Sakkinen wrote:
> On Tue Sep 12, 2023 at 10:41 AM EEST, Michal Suchánek wrote:
> > On Mon, Sep 11, 2023 at 11:39:38PM -0400, Nayna wrote:
> > > 
> > > On 9/7/23 13:32, Michal Suchánek wrote:
> > > > Adding more CC's from the original patch, looks like get_maintainers is
> > > > not that great for this file.
> > > > 
> > > > On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
> > > > > No other platform needs CA_MACHINE_KEYRING, either.
> > > > > 
> > > > > This is policy that should be decided by the administrator, not Kconfig
> > > > > dependencies.
> > > 
> > > We certainly agree that flexibility is important. However, in this case,
> > > this also implies that we are expecting system admins to be security
> > > experts. As per our understanding, CA based infrastructure(PKI) is the
> > > standard to be followed and not the policy decision. And we can only speak
> > > for Power.
> > > 
> > > INTEGRITY_CA_MACHINE_KEYRING ensures that we always have CA signed leaf
> > > certs.
> >
> > And that's the problem.
> >
> > From a distribution point of view there are two types of leaf certs:
> >
> >  - leaf certs signed by the distribution CA which need not be imported
> >    because the distribution CA cert is enrolled one way or another
> >  - user generated ad-hoc certificates that are not signed in any way,
> >    and enrolled by the user
> >
> > The latter are vouched for by the user by enrolling the certificate, and
> > confirming that they really want to trust this certificate. Enrolling
> > user certificates is vital for usability or secure boot. Adding extra
> > step of creating a CA certificate stored on the same system only
> > complicates things with no added benefit.
> 
> This all comes down to the generic fact that kernel should not
> proactively define what it *expects* sysadmins.
> 
> CA based infrastructure like anything is a policy decision not
> a decision to be enforced by kernel.

Secure boot requires a signature chain of trust.  IMA extends the
secure and trusted boot concepts to the kernel. Missing from that
signature chain of trust is the ability of allowing the end
machine/system owner to load other certificates without recompiling the
kernel. The introduction of the machine keyring was to address this.

I'm not questioning the end user's intent on loading local or third
party keys via the normal mechanisms. If the existing mechanism(s) for
loading local or third party keys were full-proof, then loading a
single certificate, self-signed or not, would be fine. However, that
isn't the reality.  The security of the two-stage approach is simply
not equivalent to loading a single certificate.  Documentation could
help the end user/system owner to safely create (and manage) separate
certificate signing and code signing certs.

Unlike UEFI based systems, PowerVM defines two variables trustedcadb
and moduledb, for storing certificate signing and code signing
certificates respectively.  First the certs on the trustedcadb are
loaded and then the ones on moduledb are loaded.

-- 
thanks,

Mimi

