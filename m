Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C98792CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 12:17:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvB1R3kqkz3vZL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 22:16:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 314 seconds by postgrey-1.37 at boromir; Tue, 12 Mar 2024 22:16:38 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvB122HPjz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 22:16:38 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id E95E1100DA1D9;
	Tue, 12 Mar 2024 12:11:09 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id AFE422BC2D8; Tue, 12 Mar 2024 12:11:09 +0100 (CET)
Date: Tue, 12 Mar 2024 12:11:09 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [RFC PATCH v2 2/3] dt-bindings: tpm: Add linux,sml-log to
 ibm,vtpm.yaml
Message-ID: <ZfA4TZspY7oOQ4vz@wunner.de>
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-3-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311132030.1103122-3-stefanb@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 11, 2024 at 09:20:29AM -0400, Stefan Berger wrote:
> Add linux,sml-log, which carries the firmware TPM log in a uint8-array, to
> the properties. Either this property is required or both linux,sml-base and
> linux,sml-size are required. Add a test case for verification.
> 
> Fixes: 82003e0487fb ("Documentation: tpm: add the IBM Virtual TPM device tree binding documentation")

The Fixes tag is confusing.  The patch won't even apply cleanly to the
v4.10 commit referenced here as the conversion to yaml happened only
recently with v6.8.

Why is the Fixes tag necessary in the first place?  Same question for
the other patches in the series.  This looks like feature work rather
than a fix.  Not sure whether it satisfies the "obviously correct"
rule per Documentation/process/stable-kernel-rules.rst.


> --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> @@ -74,8 +74,6 @@ required:
>    - ibm,my-dma-window
>    - ibm,my-drc-index
>    - ibm,loc-code
> -  - linux,sml-base
> -  - linux,sml-size

I assume that either these two or the new "linux,sml-log" property
are (still) required?  If so, a quick grep through the bindings
(e.g. auxdisplay/img,ascii-lcd.yaml) shows that the following
might work:

required:
  - ...

oneOf:
  - required:
      - linux,sml-base
  - required:
      - linux,sml-log


> --- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> +++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> @@ -30,6 +30,11 @@ properties:
>        size of reserved memory allocated for firmware event log
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  linux,sml-log:
> +    description:
> +      Content of firmware event log

Please add one or two sentences of context so that readers don't
need to use git blame + git log to find out what this is for.
(Mention at least that the property may be used to pass the log
to a kexec kernel.)


> -# must only have either memory-region or linux,sml-base
> +# must only have either memory-region or linux,sml-base/size or linux,sml-log
>  # as well as either resets or reset-gpios
>  dependentSchemas:
>    memory-region:
>      properties:
>        linux,sml-base: false
> +      linux,sml-log: false
>    linux,sml-base:
>      properties:
>        memory-region: false
> +      linux,sml-log: false
> +  linux,sml-log:
> +    properties:
> +      memory-region: false
> +      linux,sml-base: false
> +      linux,sml-size: false

Could you add "linux,sml-size: false" to "memory-region" as well
while at it for consistency?

Thanks,

Lukas
