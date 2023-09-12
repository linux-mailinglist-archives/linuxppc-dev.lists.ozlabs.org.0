Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3C79D9D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:57:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k+gAYzMd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlZBV2bWpz3dWM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 05:57:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k+gAYzMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlZ9Y2mp6z3dTX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 05:57:05 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CJcrws013557;
	Tue, 12 Sep 2023 19:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=O5R4yk5s81mOKD4h+HS+3H/HYrvHD/FA/TtAzZs+wtk=;
 b=k+gAYzMdGXSJShL9MVK90k054Kmgtg0UMWgXF0bRV35WUl82jvT8kdk18L3i7fAqnv8W
 QpIQp2OhN4RMwNUjwIkVIIhzXD6WyzoWs7EeGjyUy64wdzR6lw5mXCGPr2lJWglVn8MZ
 MqNUcHwVfMxbKJtKevZse9oHVKYL7Y8Pyczj7VgqTcw6JihgBRviJeDqQDkNL9Vu3G0O
 HzzUZXdw9w6mX4uhpyJp9ZJUdnWaUmcl2FNh8f/WV+QXh/WC4I3OqwJB+cCvv6iJAURB
 EaKqeIycfLoDSECLZqOIik8f5emLufcxiurRHQQB4fEWgqoNVgSz6rDTsHmv0O9c1U6K Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2wxc1087-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:56:56 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38CJd6u1014071;
	Tue, 12 Sep 2023 19:56:56 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2wxc107x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:56:56 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38CJcchK012069;
	Tue, 12 Sep 2023 19:56:55 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13dyp022-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:56:55 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38CJuriP39649768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 19:56:54 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7EC758055;
	Tue, 12 Sep 2023 19:56:53 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 881865804B;
	Tue, 12 Sep 2023 19:56:52 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.watson.ibm.com (unknown [9.31.99.213])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Sep 2023 19:56:52 +0000 (GMT)
Message-ID: <f5759a6275ca1e978f33fb7bad53ee68a79d3609.camel@linux.ibm.com>
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
From: Mimi Zohar <zohar@linux.ibm.com>
To: Jarkko Sakkinen <jarkko@kernel.org>,
        Michal =?ISO-8859-1?Q?Such=E1nek?=
	 <msuchanek@suse.de>,
        Nayna <nayna@linux.vnet.ibm.com>
Date: Tue, 12 Sep 2023 15:56:52 -0400
In-Reply-To: <CVH6U03GHUXW.3V31YS67OXMQS@suppilovahvero>
References: <20230907165224.32256-1-msuchanek@suse.de>
	 <20230907173232.GD8826@kitsune.suse.cz>
	 <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
	 <20230912074116.GL8826@kitsune.suse.cz>
	 <CVGUFUEQVCHS.37OA20PNG9EVB@suppilovahvero>
	 <afba92bc2961c758d34ab340de207beb0a3b84b0.camel@linux.ibm.com>
	 <CVH6U03GHUXW.3V31YS67OXMQS@suppilovahvero>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E3ajPj7DuwbxoSFWxRgrwOFdKkY5sMzQ
X-Proofpoint-GUID: JgKj7eWT6P6o28yIE9BTYJDkdKpjp4DP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120165
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

On Tue, 2023-09-12 at 22:32 +0300, Jarkko Sakkinen wrote:
> On Tue Sep 12, 2023 at 10:22 PM EEST, Mimi Zohar wrote:
> > On Tue, 2023-09-12 at 12:49 +0300, Jarkko Sakkinen wrote:
> > > On Tue Sep 12, 2023 at 10:41 AM EEST, Michal Suchánek wrote:
> > > > On Mon, Sep 11, 2023 at 11:39:38PM -0400, Nayna wrote:
> > > > > 
> > > > > On 9/7/23 13:32, Michal Suchánek wrote:
> > > > > > Adding more CC's from the original patch, looks like get_maintainers is
> > > > > > not that great for this file.
> > > > > > 
> > > > > > On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
> > > > > > > No other platform needs CA_MACHINE_KEYRING, either.
> > > > > > > 
> > > > > > > This is policy that should be decided by the administrator, not Kconfig
> > > > > > > dependencies.
> > > > > 
> > > > > We certainly agree that flexibility is important. However, in this case,
> > > > > this also implies that we are expecting system admins to be security
> > > > > experts. As per our understanding, CA based infrastructure(PKI) is the
> > > > > standard to be followed and not the policy decision. And we can only speak
> > > > > for Power.
> > > > > 
> > > > > INTEGRITY_CA_MACHINE_KEYRING ensures that we always have CA signed leaf
> > > > > certs.
> > > >
> > > > And that's the problem.
> > > >
> > > > From a distribution point of view there are two types of leaf certs:
> > > >
> > > >  - leaf certs signed by the distribution CA which need not be imported
> > > >    because the distribution CA cert is enrolled one way or another
> > > >  - user generated ad-hoc certificates that are not signed in any way,
> > > >    and enrolled by the user
> > > >
> > > > The latter are vouched for by the user by enrolling the certificate, and
> > > > confirming that they really want to trust this certificate. Enrolling
> > > > user certificates is vital for usability or secure boot. Adding extra
> > > > step of creating a CA certificate stored on the same system only
> > > > complicates things with no added benefit.
> > > 
> > > This all comes down to the generic fact that kernel should not
> > > proactively define what it *expects* sysadmins.
> > > 
> > > CA based infrastructure like anything is a policy decision not
> > > a decision to be enforced by kernel.
> >
> > Secure boot requires a signature chain of trust.  IMA extends the
> > secure and trusted boot concepts to the kernel. Missing from that
> > signature chain of trust is the ability of allowing the end
> > machine/system owner to load other certificates without recompiling the
> > kernel. The introduction of the machine keyring was to address this.
> >
> > I'm not questioning the end user's intent on loading local or third
> > party keys via the normal mechanisms. If the existing mechanism(s) for
> > loading local or third party keys were full-proof, then loading a
> > single certificate, self-signed or not, would be fine. However, that
> > isn't the reality.  The security of the two-stage approach is simply
> > not equivalent to loading a single certificate.  Documentation could
> > help the end user/system owner to safely create (and manage) separate
> > certificate signing and code signing certs.
> >
> > Unlike UEFI based systems, PowerVM defines two variables trustedcadb
> > and moduledb, for storing certificate signing and code signing
> > certificates respectively.  First the certs on the trustedcadb are
> > loaded and then the ones on moduledb are loaded.
> 
> There's pragmatic reasons to make things more open than they should be
> in production. As a hardware example I still possess Raspberry Pi 3B for
> test workloads because it has a broken TZ implementation. The world is
> really bigger than production workloads.
> 
> It would be better to document what you said rather than enforce the
> right choice IMHO (e.g. extend Kconfig documentation).

PowerVM LPARs are more about production workloads than a Raspberry Pi. 
:)

-- 
thanks,

Mimi


