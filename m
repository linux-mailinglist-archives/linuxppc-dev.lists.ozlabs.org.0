Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E361C3608
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 15:41:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jL5V5WlnzDqJB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 23:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jKwh3k1KzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 23:33:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46jKwd5hk3z8t9Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 23:33:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46jKwd14B0z9sR8; Tue,  1 Oct 2019 23:33:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46jKwc5Hhxz9sR5;
 Tue,  1 Oct 2019 23:33:36 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id 41so11501826oti.12;
 Tue, 01 Oct 2019 06:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=7bROK01xwlSENl9kjp9ya1aE8CkURZg+8d3OKCgxRA8=;
 b=lWAby85UFPgnxw4klhiMXd3hvfaEUsn1beJtSz62Xy8htpSjQBnpHEOtWVjEjsK046
 4C0u/H8R16UMhchrLYTT6221wJegBbHXWI9YVNMq+K7gSIL9KQGrwp0pC7WbS6rud97L
 Cey467C88fZ/1osI8rQaKBN0g1k1l7gFvn2YtA+AyLn8eeTeowPKlL6OZzV8w0Pum/kN
 WC2LswrUC93UEXQZHfZLr7ksH4FrSQpAEcrOW5CnaN23suRgFFHhCst1hOGhJyYfU6a6
 lgdXXgrJIHeskAkoVsyUP/m1rzryjrl9D1KGIwVWpr6ldnF2PqynPO3cVeeRd3iuKnbe
 Oy2w==
X-Gm-Message-State: APjAAAUG2L5NsnFqQ/6zyGXGC3JzsFhO3IP38EtU7PO9M4rcrZg8WCcO
 HusgUtHdjx1oueOfB/Yf6g==
X-Google-Smtp-Source: APXvYqwIiJRyPystWgh+WNFIkcDPblkPZi2wdKX63/SEIRNl5QsnwNA7OXltollpd2UZcOwwiOoXqw==
X-Received: by 2002:a05:6830:17cd:: with SMTP id
 p13mr18719757ota.161.1569936812049; 
 Tue, 01 Oct 2019 06:33:32 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e5sm4877949otr.81.2019.10.01.06.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 06:33:31 -0700 (PDT)
Date: Tue, 1 Oct 2019 08:33:30 -0500
From: Rob Herring <robh@kernel.org>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH v6 1/9] dt-bindings: ibm, secureboot: secure boot specific
 properties for PowerNV
Message-ID: <20191001133330.GA29810@bogus>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-2-git-send-email-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1569594360-7141-2-git-send-email-nayna@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 27, 2019 at 10:25:52AM -0400, Nayna Jain wrote:
> PowerNV represents both the firmware and Host OS secureboot state of the
> system via device tree. This patch adds the documentation to give
> the definition of the nodes and the properties.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  .../bindings/powerpc/ibm,secureboot.rst       | 76 ++++++++++++++++
>  .../devicetree/bindings/powerpc/secvar.rst    | 89 +++++++++++++++++++
>  2 files changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
>  create mode 100644 Documentation/devicetree/bindings/powerpc/secvar.rst
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
> new file mode 100644
> index 000000000000..03d32099d2eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0

Not the right form for reST files.

> +*** NOTE ***
> +This document is copied from OPAL firmware
> +(skiboot/doc/device-tree/ibm,secureboot.rst)

Why copy into the kernel?

Plus, the bindings are in the process of being converted to schema. What 
would I do with these files?

> +************
> +.. _device-tree/ibm,secureboot:
> +
> +ibm,secureboot
> +==============
> +
> +The ``ìbm,secureboot`` node provides secure boot and trusted boot information
> +up to the target OS. Further information can be found in :ref:`stb-overview`.
> +
> +Required properties
> +-------------------
> +
> +.. code-block:: none
> +
> +    compatible:         Either one of the following values:
> +
> +                        ibm,secureboot-v1  :  The container-verification-code
> +                                              is stored in a secure ROM memory.
> +
> +                        ibm,secureboot-v2  :  The container-verification-code
> +                                              is stored in a reserved memory.
> +                                              It described by the ibm,cvc child
> +                                              node.
> +
> +                        ibm,secureboot-v3  :  The container-verification-code
> +                                              is stored in a reserved memory.
> +                                              It described by the ibm,cvc child
> +                                              node. Secure variables are
> +                                              supported. `secvar` node should
> +                                              be created.
> +
> +    secure-enabled:     this property exists when the firmware stack is booting
> +                        in secure mode (hardware secure boot jumper asserted).
> +
> +    trusted-enabled:    this property exists when the firmware stack is booting
> +                        in trusted mode.
> +
> +    hw-key-hash:        hash of the three hardware public keys trusted by the
> +                        platformw owner. This is used to verify if a firmware
> +                        code is signed with trusted keys.
> +
> +    hw-key-hash-size:   hw-key-hash size
> +
> +    secvar:             this node is created if the platform supports secure
> +                        variables. Contains information about the current
> +                        secvar status, see 'secvar.rst'.
> +
> +Obsolete properties
> +-------------------
> +
> +.. code-block:: none
> +
> +    hash-algo:          Superseded by the hw-key-hash-size property in
> +                        'ibm,secureboot-v2'.
> +
> +Example
> +-------
> +
> +.. code-block:: dts
> +
> +    ibm,secureboot {
> +        compatible = "ibm,secureboot-v2";
> +        secure-enabled;
> +        trusted-enabled;
> +        hw-key-hash-size = <0x40>;
> +        hw-key-hash = <0x40d487ff 0x7380ed6a 0xd54775d5 0x795fea0d 0xe2f541fe
> +                       0xa9db06b8 0x466a42a3 0x20e65f75 0xb4866546 0x0017d907
> +                       0x515dc2a5 0xf9fc5095 0x4d6ee0c9 0xb67d219d 0xfb708535
> +                       0x1d01d6d1>;
> +        phandle = <0x100000fd>;
> +        linux,phandle = <0x100000fd>;
> +    };
> diff --git a/Documentation/devicetree/bindings/powerpc/secvar.rst b/Documentation/devicetree/bindings/powerpc/secvar.rst
> new file mode 100644
> index 000000000000..47793ab9c2a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/secvar.rst
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: GPL-2.0
> +*** NOTE ***
> +This document is copied from OPAL firmware
> +(skiboot/doc/device-tree/secvar.rst)
> +************
> +.. _device-tree/ibm,secureboot/secvar:
> +
> +secvar
> +======
> +
> +The ``secvar`` node provides secure variable information for the secure
> +boot of the target OS.
> +
> +Required properties
> +-------------------
> +
> +.. code-block:: none
> +
> +    compatible:         this property is set based on the current secure
> +                        variable scheme as set by the platform.
> +
> +    status:             set to "fail" if the secure variables could not
> +                        be initialized, validated, or some other
> +                        catastrophic failure.
> +
> +    update-status:      contains the return code of the update queue
> +                        process run during initialization. Signifies if
> +                        updates were processed or not, and if there was
> +                        an error. See table below
> +
> +    secure-mode:        a u64 bitfield set by the backend to determine
> +                        what secure mode we should be in, and if host
> +                        secure boot should be enforced.
> +
> +Example
> +-------
> +
> +.. code-block:: dts
> +
> +    secvar {
> +        compatible = "ibm,edk2-compat-v1";
> +        status = "okay";
> +        secure-mode = "1";
> +    };
> +
> +Update Status
> +-------------
> +
> +The update status property should be set by the backend driver to a value
> +that best fits its error condtion. The following table defines the
> +general intent of each error code, check backend specific documentation
> +for more detail.
> +
> ++-----------------+-----------------------------------------------+
> +| update-status   | Generic Reason                                |
> ++-----------------|-----------------------------------------------+
> +| OPAL_SUCCESS    | Updates were found and processed successfully |
> ++-----------------|-----------------------------------------------+
> +| OPAL_EMPTY      | No updates were found, none processed         |
> ++-----------------|-----------------------------------------------+
> +| OPAL_PARAMETER  | Unable to parse data in the update section    |
> ++-----------------|-----------------------------------------------+
> +| OPAL_PERMISSION | Update failed to apply, possible auth failure |
> ++-----------------|-----------------------------------------------+
> +| OPAL_HARDWARE   | Misc. storage-related error                   |
> ++-----------------|-----------------------------------------------+
> +| OPAL_RESOURCE   | Out of space (somewhere)                      |
> ++-----------------|-----------------------------------------------+
> +| OPAL_NO_MEM     | Out of memory                                 |
> ++-----------------+-----------------------------------------------+
> +
> +Secure Mode
> +-----------
> +
> ++-----------------------+------------------------+
> +| backend specific-bits |      generic mode bits |
> ++-----------------------+------------------------+
> +64                     32                        0
> +
> +The secure mode property should be set by the backend driver. The least
> +significant 32 bits are reserved for generic modes, shared across all
> +possible backends. The other 32 bits are open for backends to determine
> +their own modes. Any kernel must be made aware of any custom modes.
> +
> +At the moment, only one general-purpose bit is defined:
> +
> +``#define SECVAR_SECURE_MODE_ENFORCING  0x1``
> +
> +which signals that a kernel should enforce host secure boot.
> -- 
> 2.20.1
> 
