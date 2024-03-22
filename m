Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7688650F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 03:12:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sk+QoMQ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V15Rz1pyMz3vXx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 13:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sk+QoMQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V15RG3pptz3d2g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 13:11:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81DBC6134A;
	Fri, 22 Mar 2024 02:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1509C433C7;
	Fri, 22 Mar 2024 02:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711073478;
	bh=bRUwXwcq6+UznH+399UPrJYqI6arNzHseoKpLcYfxe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sk+QoMQ/o/oN7+yK5p3GzogBuI4EwkmP2qoj2f+DN+Z5xODTM9DgPF4n9Os1lZTjh
	 amV+GtKXHwvdiF82dE8cM8qjZ1f6GtWr95h9Pdna7Ln074skbhvZY6ZkneJkYdy7KK
	 KWmZI0XYVINaOfi5ZHxZ58ZZ+wI6AcqvWLzcPutkO7pB5peg5FqnMPNYno6sd5MORI
	 Hfd48TIpZhCL152ozoT7t4nko3jiWykPzxCyg7A2kLlZ7KzkJdgIXVmhSncHqsGP80
	 002dQAXzprnGPhlPMBz7lssZCSPJ8sfS5WrUKA1yw6aniyTfcLdPGydVn/LYb+mHgw
	 SyaXf7AfvxwJQ==
Date: Thu, 21 Mar 2024 21:11:15 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: hwmon: as370: convert to dtschema
Message-ID: <171107347196.3412490.13524573365195502461.robh@kernel.org>
References: <20240321-hwmon_dtschema-v1-0-96c3810c3930@gmail.com>
 <20240321-hwmon_dtschema-v1-1-96c3810c3930@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321-hwmon_dtschema-v1-1-96c3810c3930@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 21 Mar 2024 19:43:42 +0100, Javier Carrasco wrote:
> Convert existing binding to support validation.
> 
> This is a straightforward conversion with now new properties.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/as370.txt  | 11 --------
>  .../devicetree/bindings/hwmon/syna,as370.yaml      | 32 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 11 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

