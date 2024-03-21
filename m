Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3668861FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 21:46:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6gjbxZ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0yDX0q5Gz3vXG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 07:46:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6gjbxZ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0yC267N6z3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 07:45:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F1FFCE1626;
	Thu, 21 Mar 2024 20:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C59C43601;
	Thu, 21 Mar 2024 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711053916;
	bh=3eBlFz/sSUhvmfV25P1DwPyaqJaTiVHOe13+ZmRKUjA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=M6gjbxZ9gYE+LSqJvo023XRtkB7GKSCpXa8rTXyD1BiAV4PT7pstU5c0tEAHbdQTg
	 1IpZYbTOqsvw4kG9VG9f0PP1cEutR/OhvvELS0gveBJRvlqVfvo/8FHESCLEwSfrRp
	 P+XLJbKmWoIAgBgZSqyGXqfQ/yPrn4E3cXFz/xq76UuooA7DfAYhfr22fGSOSJcc3w
	 BSB1MwOi+aOYZK6PyKK9ilmddjYtVEAufXxz20OevNHy1OmijNBs4+RvveaYLIsmQX
	 M9ILy5xHkUkT9z0DaVOBTZy80SfaatKEdcC6xZjIvSkSMKc9PyIieVQMAu3M4668Gz
	 NuppTwNHuPnNQ==
Date: Thu, 21 Mar 2024 15:45:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240321-hwmon_dtschema-v1-4-96c3810c3930@gmail.com>
References: <20240321-hwmon_dtschema-v1-0-96c3810c3930@gmail.com>
 <20240321-hwmon_dtschema-v1-4-96c3810c3930@gmail.com>
Message-Id: <171105391136.2619321.2269174648422625974.robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: hwmon: stts751: convert to dtschema
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 21 Mar 2024 19:43:45 +0100, Javier Carrasco wrote:
> Convert existing binding to support validation.
> 
> This is a straightforward conversion with no new properties.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/st,stts751.yaml      | 41 ++++++++++++++++++++++
>  .../devicetree/bindings/hwmon/stts751.txt          | 15 --------
>  2 files changed, 41 insertions(+), 15 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/ibm,powernv.example.dtb: sensor: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/hwmon/st,stts751.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/ibm,powernv.example.dtb: sensor: 'sensor-id' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/st,stts751.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240321-hwmon_dtschema-v1-4-96c3810c3930@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

