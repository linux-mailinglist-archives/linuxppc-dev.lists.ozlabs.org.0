Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5203E30A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 23:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhJ3D2dxsz3dHg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 07:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.41; helo=mail-io1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhJ2t3263z3cTT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 07:07:32 +1000 (AEST)
Received: by mail-io1-f41.google.com with SMTP id y1so14016639iod.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 14:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2SKEqkCGO8SZF6WOXnVbncMlr9FaMp+IEHcaIiXZQRQ=;
 b=Hi3FbWbYg2L28jERYIU1TLdUP9CrCT0qocXnDk5KqA4dzQIGBzDnILKtgx6QwagBzd
 Mc89iqd+v4fk4G15ASlGetaPHpL64sbjTCuljRfSDjYfjdSEeOBw2+geNSfKuxvykQ/y
 mpSw+3VSQD3SjNkelGWa1Iqys9bcUSdkolS/gW3//fXXi/Bf8HDi+xPozqMbl620PCfw
 xcCRooVlI5z3qbgox1skkqTAabpzoKZGQ4KlBuGaWVrhfJ9B8Hq2x3IJpfho6sJFSlfK
 HtxT2Bq4R7Ur1p7edwlYGWk+yndgbHc0/hkCUMIk+qgMeJpLfFI3Udf+yA9/XlTM5Fd0
 E/pw==
X-Gm-Message-State: AOAM532EAOB9cdK5CEtHox36hcDbWNhBxwoZTDqE03oVPNL+ql02ajWP
 4tHO8XrVoZ/Ky++cQtd8oA==
X-Google-Smtp-Source: ABdhPJwndFJtx3b3ZDvSAkeey37JrPQb+hvwBzcT0Ovv8ZFy6MGxo+EtaiMARDc58qLubkKewF+wCg==
X-Received: by 2002:a05:6638:14d:: with SMTP id
 y13mr11762265jao.78.1628284047994; 
 Fri, 06 Aug 2021 14:07:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f7sm5152608ils.42.2021.08.06.14.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:07:27 -0700 (PDT)
Received: (nullmailer pid 1799495 invoked by uid 1000);
 Fri, 06 Aug 2021 21:07:25 -0000
Date: Fri, 6 Aug 2021 15:07:25 -0600
From: Rob Herring <robh@kernel.org>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v4 2/5] dt-bindings: nintendo-otp: Document the Wii and
 Wii U OTP support
Message-ID: <YQ2kja2CldN4ht+H@robh.at.kernel.org>
References: <20210701225743.14631-1-linkmauve@linkmauve.fr>
 <20210801073822.12452-1-linkmauve@linkmauve.fr>
 <20210801073822.12452-3-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210801073822.12452-3-linkmauve@linkmauve.fr>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linuxppc-dev@lists.ozlabs.org,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 01 Aug 2021 09:38:19 +0200, Emmanuel Gil Peyrot wrote:
> Both of these consoles use the exact same two registers, even at the
> same address, but the Wii U has eight banks of 128 bytes memory while
> the Wii only has one, hence the two compatible strings.
> 
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  .../bindings/nvmem/nintendo-otp.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
