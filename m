Return-Path: <linuxppc-dev+bounces-3372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89019D0397
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj66fdLz2yVV;
	Sun, 17 Nov 2024 23:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846330;
	cv=none; b=V+NWVN/mPHNZxPHQSXw4YTJTHQXEjf7Xnm+nDtNAJrbgvmK/V767azUDXf9QcwavPW8UAsZgFhujusk1IggLlblQAGchHTQ4hxtWGUCPvtMDeYyz/wP3S3iI9vTn+BTSAjzeOvMLQNpBj2G+KoGg+YPy4h9qJuxNrFfYleTMioqavZeTcIiv9gAbTPjXUxWDmBKxHBPyA4vl64hkJKsHxnWP7qGakC84JpkY8HVnNrpmM3d5E36XucH/HdKUQRmXpTjTC6tgl1RaIZnI4kq9JluOILWkHoU2uebYaE8jK8sQgAHolxksBlxSDVcBm3Ld1V5h1RWDeL67/gg4X/RvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846330; c=relaxed/relaxed;
	bh=s1pfaH78Q4Z5nTxYQuW66jgoyL6wLcHOJH/KOWNhcEs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hpf2+EqGdsCLgQgwa/V5klJjF/K/x2hfIqwF05vNXRVwLAzdfKsevO3KO44qVzU4qQH8Nvfg2ViIMeHhwiBd8XReD02ieeoi+9ITEalsQQZACI+dSulenWcIsJmsTGFQlL2EU45G122n8tr1dSJiQaOgEjsGwcX3WFOmtXGG7/AOBq5eB8Q8n0tmKixtW+SoZbvxXfcH4oMaCetXluIySlzBt1g/ErroWzaaZ8Pe4Fespp9d4Gg0gsiTpdr6h/9wFaX6ue4aMoW1di6oFnBQtVPjhRAx4q0B8dbHq3wf0Iv9HksSqJHce9AGZZSJ/NxvtlGw1PB+DkYlrUdr20MgzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m6AEAp4/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m6AEAp4/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj63jFTz3bhs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846327;
	bh=s1pfaH78Q4Z5nTxYQuW66jgoyL6wLcHOJH/KOWNhcEs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m6AEAp4/cGF+UAYnFVvSmfXDnNlhkYWEh+RyaC89VBTaRl/4Co/F2iFC8QcEkCmF0
	 JjaX/Jh6NhqQArpyjbEs8gp3vdjmMaVNlJmsGGVW1B/mktIssBNx6NHVdNYfcWbKMM
	 RtWEMJZIgw/CMAC7Ziuog0jODSqFoTmsSYUbWjGWbUQ6B4Mv3Z/A5Jmx8v9/oR+hqT
	 a0AfSFCjPGQUbLLFnp1/z9NKTCeDxMcNYfdevnW078kQPA4bwNNGTX4sb4J8X2NMei
	 MtVbgqFA43yPRGHk010xk5T6l+bMfCp6TUKJGNdrNAqjlM8qw1Ju+s/NC3U7ktoUYv
	 qnlGhrHH8WZYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj33JF2z4xf0;
	Sun, 17 Nov 2024 23:25:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, peterx@redhat.com, groug@kaod.org, sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241024191232.1570894-2-mchauras@linux.ibm.com>
References: <20241024191232.1570894-2-mchauras@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/xmon: symbol lookup length fixed
Message-Id: <173184539762.890800.10077987479160659193.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 25 Oct 2024 00:42:33 +0530, Mukesh Kumar Chaurasiya wrote:
> Currently this cannot lookup symbol beyond 64 characters in some cases
> like "ls", "lp" and "t"
> 
> Fix this by using KSYM_NAME_LEN instead of fixed 64 characters
> 
> 

Applied to powerpc/next.

[1/1] powerpc/xmon: symbol lookup length fixed
      https://git.kernel.org/powerpc/c/b196db2f536645eda7684655f3fae913e33fda4b

cheers

