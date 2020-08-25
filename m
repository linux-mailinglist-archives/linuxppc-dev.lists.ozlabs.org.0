Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E382518C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 14:43:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbTF400qdzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 22:43:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.181; helo=mx02.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=WZjTZ7FE; dkim-atps=neutral
Received: from mx02.puc.rediris.es (outbound6sev.lav.puc.rediris.es
 [130.206.19.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbTBt3mPtzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 22:41:38 +1000 (AEST)
Received: from mta-out03.sim.rediris.es (mta-out03.sim.rediris.es
 [130.206.24.45])
 by mx02.puc.rediris.es  with ESMTP id 07PCfVGa012867-07PCfVGc012867
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 25 Aug 2020 14:41:31 +0200
Received: from mta-out03.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out03.sim.rediris.es (Postfix) with ESMTPS id B26153038132;
 Tue, 25 Aug 2020 14:41:31 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out03.sim.rediris.es (Postfix) with ESMTP id A30F63038133;
 Tue, 25 Aug 2020 14:41:31 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out03.sim.rediris.es
Received: from mta-out03.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out03.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9GqycDEfOhw6; Tue, 25 Aug 2020 14:41:31 +0200 (CEST)
Received: from lt-gp.iram.es (32.236.223.87.dynamic.jazztel.es [87.223.236.32])
 by mta-out03.sim.rediris.es (Postfix) with ESMTPA id 3B0F73038132;
 Tue, 25 Aug 2020 14:41:31 +0200 (CEST)
Date: Tue, 25 Aug 2020 14:41:20 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc: Update documentation of ISA versions for Power10
Message-ID: <20200825124120.GA815@lt-gp.iram.es>
References: <20200825114507.13297-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825114507.13297-1-jniethe5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=7DkJDRMyoChX/KiMn+d1NyOoMTfbSshQgJzCT7WF7Fo=;
 b=WZjTZ7FECnXnYdy7ttLfWDMVKznVb6NthiXDaBxiUWHLXRBB639rQWEEp94GE4NlVrXAB7xRI6JV
 cRRzj7jYrx+m97WVKMXfLCYBoJnzwrUkHELl184S72yAgx4n+/Lp7ImLSvgzbNp0njf7NXMP32M1
 BU4vMzZoEq1/HL02mGQgWtJydxhjA1e4gNjCS9nXAR7FE7jQb/xUHyD0XEJY2Svzs0ey2ZR7uSKw
 zMPwNy+afs0aohkc3rXM3A9NNCAqVbv8yi3R0DPAphaUvk3q2LKrca2lYcibHesf/tJpSX5Oor4E
 sJPqma/xhr1xC2c/dG+gbidNBGb+pNk/9bYhVw==
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 25, 2020 at 09:45:07PM +1000, Jordan Niethe wrote:
> Update the CPU to ISA Version Mapping document to include Power10 and
> ISA v3.1.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  Documentation/powerpc/isa-versions.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
> index a363d8c1603c..72aff1eaaea1 100644
> --- a/Documentation/powerpc/isa-versions.rst
> +++ b/Documentation/powerpc/isa-versions.rst
> @@ -7,6 +7,7 @@ Mapping of some CPU versions to relevant ISA versions.
>  ========= ====================================================================
>  CPU       Architecture version
>  ========= ====================================================================
> +Power10   Power ISA v3.1
>  Power9    Power ISA v3.0B
>  Power8    Power ISA v2.07
>  Power7    Power ISA v2.06
> @@ -32,6 +33,7 @@ Key Features
>  ========== ==================
>  CPU        VMX (aka. Altivec)
>  ========== ==================
> +Power10    Yes
>  Power9     Yes
>  Power8     Yes
>  Power7     Yes
> @@ -47,6 +49,7 @@ PPC970     Yes
>  ========== ====
>  CPU        VSX
>  ========== ====
> +Power10    Yes
>  Power9     Yes
>  Power8     Yes
>  Power7     Yes
> @@ -62,6 +65,7 @@ PPC970     No
>  ========== ====================================
>  CPU        Transactional Memory
>  ========== ====================================
> +Power10    Yes
>  Power9     Yes (* see transactional_memory.txt)
>  Power8     Yes
>  Power7     No

Huh? 

Transactional memory has been removed from the architecture for Power10. 

	Gabriel
 

