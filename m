Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FDD22190E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 02:51:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6bKJ4pjLzDqnw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 10:51:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6bH95FRfzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 10:49:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=R6Vqu16S; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6bH90r6Rz8tFw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 10:49:09 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6bH90RNDz9sT6; Thu, 16 Jul 2020 10:49:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=R6Vqu16S; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6bH84vGGz9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 10:49:08 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id p3so3978556pgh.3
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jul 2020 17:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=o2o92rwO9CkuSztudCtshx5MGMYC4PKKPlgn//SYCT0=;
 b=R6Vqu16SO4S7zlcPL9tUftEcCKhhmTuJASV1jHrkm3VX08jfTe7LOeGPzQmLuBXS8K
 bxxMJOyGywyDBigdEoLCLxIncuGOcJ4XQOKkvkC+KbaK6Y+M8e5KJbA10C7AZFsqIfbM
 GsHdaWGDhvvseGp15soN8AXWw1Cr45nqDdgzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=o2o92rwO9CkuSztudCtshx5MGMYC4PKKPlgn//SYCT0=;
 b=toIB6L/JTxNDxpucivR+mTYM8W4cuY+uo5oTu2ZKd6+DpD6ryqm9E3lr1g3AwClA2b
 mn4EU2kK2H8OqpknrpJWB/qu3xFbHt8rE7ps//WCq79Ri5OSmDsiwgcC1BlY76vtgsd/
 RyKjRtkyl1jdZPDEOc9Zpky931l3ITOmddgCd/b3qDi7OtHGzjSzVUiiAqDNn+GrdLt5
 7WPyCQI7BPaffkM8WGyrGFujt7+8Olb3FbebeRN/9IxP3Rdwh3bqTfGWils1GO8+CXW2
 wngil4+FVZ7fXUckjXL7jiw/LmENhyNlgfEjV2pVbmQFYONzlxOim5fIx1A36PANmJpT
 AHpA==
X-Gm-Message-State: AOAM533ixViOvDrxh3H/jixMbtTJx+QsyqyyP8TD9pWBAiu/zI2hjRXB
 olRWXF1CIZE1CMXsaXfcP0Ph9Q==
X-Google-Smtp-Source: ABdhPJwZ+N82U87oKOvzJ+8+ZKG3CnsD1/N4sgOMAKA9IVhp/S5iMs5muXWDZP36CYKxWy/UtLNkqQ==
X-Received: by 2002:a63:4f05:: with SMTP id d5mr1942789pgb.298.1594860546292; 
 Wed, 15 Jul 2020 17:49:06 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-64dc-606d-f98e-b592.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:64dc:606d:f98e:b592])
 by smtp.gmail.com with ESMTPSA id cv7sm3078621pjb.9.2020.07.15.17.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 17:49:05 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v3] powerpc/pseries: detect secure and trusted boot state
 of the system.
In-Reply-To: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
References: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
Date: Thu, 16 Jul 2020 10:49:02 +1000
Message-ID: <87v9iothc1.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nayna,

Looks good to me.

Sorry for not noticing this before, but I think
> +#include <asm/machdep.h>
is now superfluous (I think it's leftover from the machine_is
version?). Maybe mpe will take pity on you and remove it when he picks
up your patch.

Kind regards,
Daniel

>  
>  static struct device_node *get_ppc_fw_sb_node(void)
>  {
> @@ -23,12 +24,19 @@ bool is_ppc_secureboot_enabled(void)
>  {
>  	struct device_node *node;
>  	bool enabled = false;
> +	u32 secureboot;
>  
>  	node = get_ppc_fw_sb_node();
>  	enabled = of_property_read_bool(node, "os-secureboot-enforcing");
> -
>  	of_node_put(node);
>  
> +	if (enabled)
> +		goto out;
> +
> +	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot))
> +		enabled = (secureboot > 1);
> +
> +out:
>  	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
>  
>  	return enabled;
> @@ -38,12 +46,19 @@ bool is_ppc_trustedboot_enabled(void)
>  {
>  	struct device_node *node;
>  	bool enabled = false;
> +	u32 trustedboot;
>  
>  	node = get_ppc_fw_sb_node();
>  	enabled = of_property_read_bool(node, "trusted-enabled");
> -
>  	of_node_put(node);
>  
> +	if (enabled)
> +		goto out;
> +
> +	if (!of_property_read_u32(of_root, "ibm,trusted-boot", &trustedboot))
> +		enabled = (trustedboot > 0);
> +
> +out:
>  	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
>  
>  	return enabled;
> -- 
> 2.26.2
