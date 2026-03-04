Return-Path: <linuxppc-dev+bounces-17726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NFYE0NLqGmvsgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 16:09:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63108202467
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 16:09:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQx0v47Lwz3c2R;
	Thu, 05 Mar 2026 02:09:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772636991;
	cv=none; b=nOUlF5loPpvMIxVnisUcpmEoxtTHRnYWmxU7CL7/s3F7w+rwwKpsy8CRhzLjzY4JwzJRHYcb498ZPJ3tTp9T85gfyKQePB2AUtMO+/cV33C5LuyAtsddz+dh/JQAP1potHMRNpPqHMMwFUk3SR7049dPDaOKQyiWNzoNulpy+FHL11CNFc2QlgqcMNT7h0sWVj17HoozP8XHO/rEbNuyLnai223OMlZfqC1fTaSmZHoYu1IuINNrzaXSsZeX0aeIdlnzI8JrhOM6sYyzgQyL0kLtYc841NWVNohxaYGwiycuWyeQHM6aD9PBRygGgIhq0VDINH3nKxHj10pOIrj5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772636991; c=relaxed/relaxed;
	bh=UnYxYUy+8zrFTWbwR9LeZFJwwqG9YYaU/e//3QPYJZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqcmvnRxmraXzffvQ6SLGmEAkbAoNiEdYK4dKycJT4GvincAaSvKj661w3mZgG7WKmufL5ThtY5Jahv2ZWOJH94B3QWITToNkl/XJblk3jJsaNdEqkF5Pl3sgoMdmH6o6aPEGEf38Y4P1JsbSgMsO8Jyz20MWwIJ32Bm8s/APs2stpxMPOiKNgbza5hyLQ1NjYkUnZ5+Cncs2eooXm+xd13PjVo0j4sH2vJh0N8RwiggT2zvmC7djm8L70VQK1BLJChURz25e2QiaZY9hVMcWd8pSMOwHnnJfaGTo6/3JTlY1jiN6NPiG0t3+JEuZgOjFpYvs7S7lRB9Ymx+pgUuoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FZNErBDp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FZNErBDp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQx0t4WXlz3btw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 02:09:50 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247KJ691508241;
	Wed, 4 Mar 2026 15:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=UnYxYUy+8zrFTWbwR9LeZFJwwqG9YY
	aU/e//3QPYJZ4=; b=FZNErBDp6qjhxSEbMiU9l04mc298SEH8tvnPLaJ9ean4A7
	7K2xPOV8CgfxJ0imtFEqEnzLpkzNC4c/bEg2Hvea3i/uSbisjwgNBmjI3cUiAuyX
	XPPgoEI4BzihZrjSOdrN8yM7PcU2sVQb++QWYxMPVUMr/lisSRi9AuVwiLitXCAm
	1X+EB0luNAC+JaoFK3v3/WvLJxDgTwYOKiaqsfcSrhQqUEaV60drcDSUJi+1u8+4
	hT5jkYKrixvnhvlk5C829/WjbjQwNdjiyQUwSpLNw3r00Hlu0Mex784CEb0aa58m
	fVEriNiAX4lHjUycOThSzI4JSS9skGA9/I1ieitw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksk3yfpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 15:08:42 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 624EU8Rs016408;
	Wed, 4 Mar 2026 15:08:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmbpn74yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 15:08:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 624F8ahj25100704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Mar 2026 15:08:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B983C20040;
	Wed,  4 Mar 2026 15:08:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D11C420043;
	Wed,  4 Mar 2026 15:08:33 +0000 (GMT)
Received: from osiris (unknown [9.111.25.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  4 Mar 2026 15:08:33 +0000 (GMT)
Date: Wed, 4 Mar 2026 16:08:32 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
        Li Nan <linan122@huawei.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/25] xor: assert that xor_blocks is not called from
 interrupt context
Message-ID: <20260304150832.10892B56-hca@linux.ibm.com>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-2-hch@lst.de>
 <20260227142455.GG1282955@noisy.programming.kicks-ass.net>
 <20260303160050.GB7021@lst.de>
 <20260303195517.GC2846@sol>
 <20260304150142.10892A0b-hca@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304150142.10892A0b-hca@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 04z9E13OM3Sfpetrjwu_knlQ4Pm57vSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyMyBTYWx0ZWRfX1qKC5vwiiVti
 imQl88p4f5EEaUs36Cqd8CD0grmVfOVhch8H/6EkUdKTFPntYFZhNzfiLwzeEcRPVdfmfw/csJd
 5XjBomCKez2kWT0xu+TyUO5m86iaOsxE8uVSmI3WWQj0EIwj+0zha8PMo4rZS7UmHkn2EA23gC3
 fCKaD2O5LTbrNnhcy/sqDaVZg5VdeGyPlf7sKjPqlGMWdy7lKR+Sx4YT9Ue13j1krenv+apDdTG
 9u7pc7ax3/s4b9EW0qdkkSS/EsWcFCshcemu3qKx2gHNe1V0XILuw8E8ekEbHaLm1XHrSGLXtR7
 0VblM3ek7WLeLeq24Eb3kVOGtogA+y9AGwS9Ox7ga75U7hxD6x81KJm+aga4X4uPi6MKdrTmsXu
 Fw4NYf7Aga7uVW+KCzrlr3ubI8K6ypZGyMfLvJiVX97w/NtWfeIQ5EAiC+Bq+Ht/ezhYzKmvaFi
 hJyU1cpGtH/CwXFvztA==
X-Authority-Analysis: v=2.4 cv=csCWUl4i c=1 sm=1 tr=0 ts=69a84afb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=Lex053stx4sflTLgQTUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: EsSB8XvTAoZu7uY0i22CxoZDWK6YvNNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040123
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 63108202467
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17726-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lst.de,infradead.org,linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FORGED_SENDER(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hca@linux.ibm.com,m:ebiggers@kernel.org,m:hch@lst.de,m:peterz@infradead.org,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kerne
 l.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:01:46PM +0100, Heiko Carstens wrote:
> On Tue, Mar 03, 2026 at 11:55:17AM -0800, Eric Biggers wrote:
> > On Tue, Mar 03, 2026 at 05:00:50PM +0100, Christoph Hellwig wrote:
> > > On Fri, Feb 27, 2026 at 03:24:55PM +0100, Peter Zijlstra wrote:
> > Because of that CPU feature check, I don't think
> > "WARN_ON_ONCE(!may_use_simd())" would actually be correct here.
> > 
> > How about "WARN_ON_ONCE(!preemptible())"?  I think that covers the union
> > of the context restrictions correctly.  (Compared to in_task(), it
> > handles the cases where hardirqs or softirqs are disabled.)
> 
> I guess, this is not true, since there is at least one architecture which
> allows to run simd code in interrupt context (but which missed to implement
> may_use_simd()).

Oh, just to avoid confusion, which I may have caused: I made only
general comments about s390 simd usage. Our xor() implementation does
not make use of simd, since our normal xc instruction allows to xor up
to 256 bytes. A simd implementation wouldn't be faster.
Also here it would be possible to run it in any context.

