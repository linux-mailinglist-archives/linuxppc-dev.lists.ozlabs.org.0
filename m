Return-Path: <linuxppc-dev+bounces-12613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC5BA838D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 09:18:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZsxM2f3yz304x;
	Mon, 29 Sep 2025 17:18:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=143.55.146.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759130327;
	cv=none; b=davtg41vKbXRKpdbgiyTWh+gJ9+ESnoKj/dJ8Ohu3idvDpmLl4ajMIrN7DjswibiE5nVRD8hhxaICDTM9NiLSnxIByfS52bI94MAw9WUKMf0Eu0V+6FIB2/OjN6BgUtYDL3f/wwb/GblLz+kSIN0aNTcCbWJ1cI+HXuTjoOF9Spr6KbUqK05eXGa6enfWgsOhkSJvRlCP6zvT//LiUpb4KabfHykyOZN3zi/4OLQjK1OBRH6hOXLfPDeArtJTIOVUL1kPw47T5fQP2hhvQ/bTlbxl5ysyWB8ur5kbORPmdhBcCpUsDNONLef6OZ9bRrRy5m8BMVs4EY6955cSWxuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759130327; c=relaxed/relaxed;
	bh=VBzv5FHYPOVQGsCy9++pu/gMzxx76wtx9Gm9d8RIbhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqxDtkcqbEQf+pfx6SKegxCyA9HEeX0e0KhQ56ac2zlEwrB19FiM/5f5Ch20m98xK4XEP+swX8OQpN024IN/gPa6pMibnHH8+NNlUHDD+EYXRpshpKioG4lTveHdRzxdUDftaqVRqOYj3LsLVr100ZeQ9R3w3gWrjn8t+RQxJ30zzFh0fxwZ1Zy2h+z8pk95k0fJP2Y4fE53TKh/15HPEqPkWKY2i4hzecfqlcEh6fqfI1AR8BkCSXnS2EymvJ9Xvx4JOM3Shlm8QE+F8CC5quyoMVX6dvxa0h+X/ZOyEs7X+4ra24iHCkPGBsH+WiJAIZ4cDAz/g6VZGpPnBjxSsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=iram.es; dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=Jw3O+d3Z; dkim-atps=neutral; spf=pass (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org) smtp.mailfrom=iram.es
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=Jw3O+d3Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org)
Received: from mx07-006a4e02.pphosted.com (mx07-006a4e02.pphosted.com [143.55.146.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZsxK17r3z301Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 17:18:41 +1000 (AEST)
Received: from pps.filterd (m0316690.ppops.net [127.0.0.1])
	by mx07-006a4e02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T6V69b3377900;
	Mon, 29 Sep 2025 09:18:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iram.es; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dkim3; bh=VBzv5FHYPOVQGsCy9++pu/gMzxx7
	6wtx9Gm9d8RIbhc=; b=Jw3O+d3ZFj3c/cDEm7urNC3yFovRg9mqwVIZVrIi2vFY
	Eh+9Mqn/orQF5z7SI9ki7vElm23v1PPgLxmRf6QX79ZzvGwwtYwsuKFSeb8M2nCh
	UCkwBA+qP/gzvik6l2JxUaSGbjO/Zs+KMRC6nyNXMWV7Eu9P11ViJYkqt6UIfdQu
	wzRE0IKSDZOEwNAci9ruXd9QNOrXOkT8LQAGH3KOWXw/VOzYaE684bAYMeTqlfPW
	RHnpEBRra6NOvAv21shEm8bWFUl/ATbZkVc2YnTPUubgpEHuKMK+pS0l2s0SF/9l
	rkz6OVGlBLITTAwYO+56QOu4Zxq3NOLmTaqXI5iJjw==
Received: from mta-out01.sim.rediris.es (mta-out01.sim.rediris.es [130.206.24.43])
	by mx07-006a4e02.pphosted.com (PPS) with ESMTPS id 49fmwr0hvn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 09:18:29 +0200 (MEST)
Received: from mta-out01.sim.rediris.es (localhost.localdomain [127.0.0.1])
	by mta-out01.sim.rediris.es (Postfix) with ESMTPS id 4F061140734;
	Mon, 29 Sep 2025 09:18:29 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta-out01.sim.rediris.es (Postfix) with ESMTP id 4AEFB14072F;
	Mon, 29 Sep 2025 09:18:29 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out01.sim.rediris.es
Received: from mta-out01.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out01.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id CHbzLWsTDmXP; Mon, 29 Sep 2025 09:18:29 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy01.sim.rediris.es [130.206.24.69])
	by mta-out01.sim.rediris.es (Postfix) with ESMTPA id 15A8114001A;
	Mon, 29 Sep 2025 09:18:29 +0200 (CEST)
Date: Mon, 29 Sep 2025 09:18:27 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: RFI: powerpc cpus supporting BLRM for MSR_LE
Message-ID: <aNoywxZU7F1Ln6D7@lt-gp.iram.es>
References: <5dddd2be-e53d-4067-82aa-02146c39223d@ilande.co.uk>
 <aMUhMomd752SWzUm@gate>
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
In-Reply-To: <aMUhMomd752SWzUm@gate>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA2OSBTYWx0ZWRfXz2rU7+cAy0xe
 hovkfvCMNjjUMaUonQuvGcWudxzkgA3/PRLe4NVCfAAYDYlMOnNOPnrf7Ia2J8g5gf9pLHqnxqF
 oUEWks9tcPz9bqVuK/bLO4JxWHwTgJhoySjhEUAwsk4ZFsE7EkzVYdJ9XKqFm1q0WZ7Fyt3dg4r
 7PbC+RSgykn29hcacqzgBqzTyCpL57+7ln5EjLc0GpZJEOWtjXqQf3Bk/Z/04+BxKmBI3X66Mhf
 1s79/I01pkV1KKL4O0uhIwdjiAS33Me29+H1sMc33PgXHV+CWw4xSP61AecMvTLXoWqwGXpv3QV
 CS97wpwAjKw2Qb3oYu2m7DQoQ+LvTp+yiF9nl4NdmRBYeJFwMbbj9A/tAN4dih5YmZv2Qdnc2CS
 30RLVN4C/68tIFB3leZepJiV6vzANw==
X-Proofpoint-ORIG-GUID: WmpfzUiuSmrdrRVpQi-mCm8VKw-K705x
X-Authority-Analysis: v=2.4 cv=c5+mgB9l c=1 sm=1 tr=0 ts=68da32c5 cx=c_pps
 a=QKUl0uxKTaJPacWKUfn9WA==:117 a=QKUl0uxKTaJPacWKUfn9WA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=oY23Sqop_mXvFtQxdzQA:9
 a=CjuIK1q_8ugA:10 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: WmpfzUiuSmrdrRVpQi-mCm8VKw-K705x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=salida_notspam policy=salida score=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1011 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509290069
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,


[sorry for the delay, I had forgotten this message in my drafts]

On Sat, Sep 13, 2025 at 02:45:54AM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, Sep 12, 2025 at 08:21:10PM +0100, Mark Cave-Ayland wrote:
> > Whilst the patch is fairly complete, the problem I have is that there
> > doesn't appear to be a concise list of CPUs that use BLRM (as opposed to
> > proper LE memory accesses) when MSR_LE is enabled.
> 
> *All* older PowerPC have everything on the system busses in BE, and
> when the CPU has MSR[LE]=1 it just swaps some lanes somewhere where
> stuff is transfered to the execution cores.  Exactly how this is done
> is quite funky, but not-naturally-aligned accesses in LE mode always
> were disallowed anyway!
> 
> I'm not sure how LE is done on 970 (aka "G5"), a 64-bit core (it is
> derived from GQ, POWER4+).
> 

The 970 does not seem to have LE mode. I just had a look at the 970FX
documentation I have and both LE and ILE bits are marked as reserved.

Gabriel

> For the more current cores, since Power8 all LE and misaligned accesses
> are supported with hardly any delay at all (sometimes the hardware needs
> to do two memory accesses, but there is no exception and interrupt
> caused, etc.)  And the hardware does a real shift, a big fat barrel
> shifter in the load/store unit.
> 
> Oh, and also since P8 instructions in LE mode are stored byteswapped in
> memory, too (older CPUs had instructions in BE always).  This is done
> somewhere between the instruction cache and predecode.
> 
> > From what I can gather all 64-bit CPUs use proper LE memory accesses, but
> 
> They don't.
> 
> > it's not clear whether for 32-bit CPUs the use of BLRM can be derived from
> > the PVR or other CPU registers.
> 
> It is still not clear to me what "BLRM" really means.
> 
> > Can anyone provide any insight as to which CPUs make use of BLRM for MSR_LE?
> 
> *All* CPUs that use the 6xx bus simply swap *and duplicate* some byte
> lanes, in such a way that all naturally aligned accesses work as-if a
> "real LE access" was done.  You can investigate it on real hardware by
> seeing what happens to weird accesses.  There was something on the
> Dolphin (GCN and Wii emulator) mailing lists some years ago you might
> be able to find (I fail to currently, but I didn't look very far).
> 
> Btw:
> 
> >   g2               PVR 00810011
> 
> That is mpc82xx, which uses a "603e" core.  *All* 603 and 604 are called
> G2 (G1 was 601, G3 is 740/750, G4 is 7400/7450 (two quite different
> cores!), G5 is 970).
> 
> 
> Segher
> 
 


