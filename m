Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E428E154
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 15:31:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBCxW1GlXzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 00:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBCsL27vGzDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 00:28:03 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id e20so3363691otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 06:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZL5zSCW4abwqO0FHpIH/hdReN6zUDlAhI8F0pVQ1+U0=;
 b=nPlaU+Z7qzezH9+xEo/CR/J8/4VbCd4bpGAOz5N32AHYCvhTm+MV50jKmR0g3ZTDcL
 cGZ7kFApzxPZ7EAOEgk3S6E3BKED7WOpXa7kqpr0hpitYu9faQ3Kv+hUelyqCu7BkKGw
 ui/1DL8R/iWkEocVjN+E02iM9TG26Kjd6GFiONTzBPeQhQpVh+gr7mbuZ0HPBuMPWoH4
 nSqqV6Eun5XumYQ9htMZTQWJa7N/W+ZKSpHz8/w7w7Rrpvzvs34ZyET+eAp6Yceo9gBO
 V5ZdDB5/DjLuSQjMV+7hvjda0Dm+knLW8NUiWMk/+S9IBJLtvDMgWmpldh8OHf43lRRl
 6iSA==
X-Gm-Message-State: AOAM530bl4FDpGLnd3cFFhxmcdos8BeK8/cB9/EQWMGYZTVghu+Wm3SA
 rtb14W4DFk5OqVpC95A9+Q==
X-Google-Smtp-Source: ABdhPJx7vWvJU+mgKZyS7+CbeUNCduplAaoDS6csoJj2fWAGBxKcFikhthRG5g2vB1JTOE0K/Kpwlg==
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr1500221oth.1.1602682078846;
 Wed, 14 Oct 2020 06:27:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h25sm1165503otj.41.2020.10.14.06.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 06:27:58 -0700 (PDT)
Received: (nullmailer pid 1539238 invoked by uid 1000);
 Wed, 14 Oct 2020 13:27:56 -0000
Date: Wed, 14 Oct 2020 08:27:56 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201014132756.GA1538723@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> The host controller device might be designed to work for the particular
> products or applications. In that case its DT node is supposed to be
> equipped with the tpl-support property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 27, column 14
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/usb/usb-hcd.yaml:27:14: [error] syntax error: mapping values are not allowed here (syntax)
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1382001

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

