Return-Path: <linuxppc-dev+bounces-5381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C88A16429
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jan 2025 23:04:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YbnYl08bTz2ykX;
	Mon, 20 Jan 2025 09:04:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737324250;
	cv=none; b=eNYysptLetUTjl9PGQUR+T/gOom9J+573FOU39bamD8lS+yqP1LPZHY6K3rTyLNI7pAAL9Huz5ubYz/LdO+GxOMp00LPdNLHrt/mC0lEY0HS5mWwqSxIm8tn9O7V4wb+CoWqfI4lDVex/HGSpmxBrhuE9mnK2qbCS/RSORY7Sq6ow+3jlNFW1PLNLkE77Zm5KUHhtMaWdINspAbWJT1os0qElX0MBQ8Dgr5KYLGk32mQNO5+FhDYSPb7zsxLOjDR90ZfgEEvzJKYU06vjPXmXI3ytnJou6ZJsXv8f8qL5r1nYq7yVUNITirYbP+kYO0Y+9soqJrlpgXTEBbAfbqo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737324250; c=relaxed/relaxed;
	bh=9R7qmMdDTPRKh89/qN4mzo1C2OIB89eCEp5OFqkhBZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiaCDgvwFINlNHp4MMh5q5e2Edn1st2JpXH+GiNIkB7gVeZPjWn3Kcxch8BwyRMTq80Tuak+Hnb46SG5VgEbuOtKmmq3NtuOHg2kWEuKTvf374urbwZAI0Yr8ldG9TZl0mIPqQmfldiutar/2bAZTpJrdOB9SS5Vh6Z7Kd70pczC63vkmMqDkp2turY43tzvNAedkeIhpN7Fd3LErjqiFAqCXYI44s9e3kyVapVc9s5apbPLapjgtoZUGAMSUHpyHI6M+V5N+wCyawIRXKmNEBkwpgxgRdLEXcsxQJwHLAmXhzunvVYYtxjliEfybl0jJVXXLtVJ+2RoEbttmA9hvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=Vw2AklHm; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=Vw2AklHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YbnYf5TXjz2ykT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 09:04:02 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8F14D240101
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jan 2025 23:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1737324234; bh=ArPJ+jv3dFD/o+3NmegfZMC45T4/VEy47JZvGQTyNoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Vw2AklHmzuiw0cZp6msIUW85tSIkfQpdkv3RCpESXOxdgiXPbBkN/XtWfdLqfWIQQ
	 ot8Hqx64BI6oHDarCL/5/dncvmpAkuIbh9k04DHIwMS8nJ/exnOXZkxKwe9RhF6t4C
	 PuPlE1le5TWKyDWavOMpKJ/5BnKzRc5QbujifhnRJad27b2zUoMMUmUtxCDuJA25l8
	 //4fc4D0+r2TH1+l3pkLbErlg1xl1lXVkJCqZo4SyPpbvPkjoT9qTzfB73rw1EYWSx
	 KVVNCmUz3lrDhwUIAiFp6AOIhm8sVacSMbqDLIz1AL+ZqEO11uLUIzb4oUU27+Tkli
	 UJ6qkp21emciQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YbnYL43NWz6ty9;
	Sun, 19 Jan 2025 23:03:50 +0100 (CET)
Date: Sun, 19 Jan 2025 22:03:50 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 16/19] powerpc: dts: Add LANCOM NWAPP2 board devicetree
Message-ID: <Z412xoyT7REyAejU@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
 <b1e0fa68-6f55-4c21-8d61-f8d58d932afc@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1e0fa68-6f55-4c21-8d61-f8d58d932afc@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 04:24:27PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2025 19:31, J. Neuschäfer via B4 Relay wrote:
[...]
> > +	compatible = "lancom,nwapp2", "fsl,mpc8314e";
> 
> Missing bindings. Please run scripts/checkpatch.pl and fix reported
> warnings. After that, run also `scripts/checkpatch.pl --strict` and
> (probably) fix more warnings. Some warnings can be ignored, especially
> from --strict run, but the code here looks like it needs a fix. Feel
> free to get in touch if the warning is not clear.

I'm currently aiming for 5-10 converted/new bindings in YAML format.
Should I rather put them into a separate series, or include them in this one?

Best regards,
J. Neuschäfer

