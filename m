Return-Path: <linuxppc-dev+bounces-8504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FE0AB37CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 14:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zwzz94qkMz2yRn;
	Mon, 12 May 2025 22:52:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747054357;
	cv=none; b=MmTTinCH2PuBc+9xwqd36Ui/iyAeqG8Sl774xcxp0BC8/aw/antOqtdk67qGfw21VVEj3iuLyn7yV/krnkEFAK1UX7Nxi0brAXjE4IWmFwtxEwEW+EOZMaaE3hjot0txSN+lvF5VZNqLV3YRrcUsA22YXwSQ5tfQVlQzsXSKBdsjC5uo9RFiOTOQR19hav6/22sPTOycmnIyXJxKuqf15POQp7kwxIsL06ihZbSxpATe3i5zqs365knFE+I5GKqvQAUHysx8MgdUgqLpxb2YGxELttYo3vwOtL5WoqskCnV7w5ngTgynCbq/jE7hHbV+vKnA8NAT3RpIXiZLZF5Ulg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747054357; c=relaxed/relaxed;
	bh=7jlDTWGBmrm12R/qZPIgl88oSzrTVBrWSW+2XeZsOmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jll0QsKSOU3sJOHDbsqs/OX+1QhBtMcFDoV/ma3q6K9dirZRv4LkYXReD8qiEcxCFa9otDpKo3dEKUEnYqioTmN86Eja/H2lcXRlpBFMylP73PPkR+4yTUEcJCIux81/pshBFWLsboOtcjETyv3jG07tF59TLKDMDlVMopTEQvp0XQUhVc6A+7BtjLI/uUROzTrM/yQiMB/LOWzPVCC2sszjHkjm+b7pWqkinlfL9LmfTyiQG62eBZIZIBqExMyBJQVX8SzFnKQjkVjh39R9c9iO6SRdPiU9nuy7vzbC1peQQPeSoBA01CZHAHN32+RdqObfJ0qmyd4rbc69fcOxyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RAfVIzWs; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RAfVIzWs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zwzz84fGnz2yGx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 22:52:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A6A7A4D130;
	Mon, 12 May 2025 12:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF990C4CEED;
	Mon, 12 May 2025 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054353;
	bh=8ZmiWEvYDdcWO94VvVuvtMz1yjFZ7HIfQWAcdyV8D+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAfVIzWsPVZm7gw396VeBjXGD+0F9G4XAL6WIXJE8dCziqLBFcDeROkJqAOOl0aig
	 I9JplluoHJnSJ20Y+OE4pcJuzeX+d/hesUp2uqs7zql+0JEwvvaHXR1IwD3qrhfoJG
	 WDQPeqRLc1gbUAe2HubdoWqxa/GduSgKWc0Jfvuh/hci39QKmYjBlqs7cFSMkalAGK
	 ideD98/y7d6jMLrm+MLy67iGXwT7Om9+UF0U5WnZY1sjPy9ZuXpqAMyGC6pjaP6XLi
	 Hzq5PiaYciW7O1O1aEd7uUxYYjY6kuKHJ8iRR0/7xLdQYQsW926fwweDjYiZsOx0sq
	 xYjZyYXOv8XWw==
Date: Mon, 12 May 2025 07:52:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml
 reference
Message-ID: <174705434967.2948939.9106067871185056281.robh@kernel.org>
References: <20250507154231.1590634-1-robh@kernel.org>
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
In-Reply-To: <20250507154231.1590634-1-robh@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 07 May 2025 10:42:31 -0500, Rob Herring (Arm) wrote:
> The reserved-memory.yaml reference needs the full path. No warnings were
> generated because the example has the wrong compatible string, so fix
> that too.
> 
> Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml format")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!


