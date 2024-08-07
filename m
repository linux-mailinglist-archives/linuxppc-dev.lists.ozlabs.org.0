Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F494A31F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 10:44:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=aFmvoyEc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf3dM666rz3d9T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 18:44:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=aFmvoyEc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf3cf1w3cz3cWc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 18:43:59 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-709485aca4bso692340a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1723020237; x=1723625037; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Iw7Tv+YETDv5W6d9wVYOGpd/7bHckBYfrgRk1yNks+I=;
        b=aFmvoyEcFHO16EQQ1NX/CdNgPp0H99AzcOaS+pzifCqD3ool0b9GB/8m3lut1a9n8C
         2y+l/C//cj8IYTrPNwxjY70Lw2+gE+DE81mz8FDczlY6FDPpcI5OHDI1aXq0Xt2cUKrH
         pOK7WfnwR19n9F90cmiw9fT61O1+VAAZku5STP1uCDtf3+dvPTGmmZ/gzUFCRBXN5yTo
         Q3ThQgd4froyeS4y5zxEJmCCq3A0Wd7e1wo0YU5pv1+gUAIp1QT+CPe6EE1F6InKY8kz
         +WmuLBSIvjqUHJ6ZAefBPiRD7uEs21FSAvlwa0EbKmJyzxoRu4hHzCzBQkvfhrBdF4oQ
         yxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723020237; x=1723625037;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw7Tv+YETDv5W6d9wVYOGpd/7bHckBYfrgRk1yNks+I=;
        b=JHgjjZyL005UWLXEka1XAhXMPV8RA2jttZW4mkB1/IH74HU/XMbue710Zw+ahklizm
         kV3pKwT14/MK0OyW2A07NGRW9aHu1lZLHb0X3vEQiNrsY7sXOyOKqnhIsdmYbOUBHJL4
         9YLpj61lEQp4EF0qGywPA0CeK5dMvtz878HJlcZ7FRIvL3lP19s1lP6hcUX/3tW6crUh
         oZ3ZlFfZfU4h2SrD6b+fE7z2Q52snyqoyyTdil2gdg78HRSMiyT1hc2DVxiHaJ2ThBbK
         LR8+/M8K28AP5vQJpJeR60iSYX2xESts6QkMmn/is7eOWPxO/fzV799XkQAMHLOYgE77
         ICIA==
X-Forwarded-Encrypted: i=1; AJvYcCWFzEikbACIcLbO537Grl1XLksiBe5TqGDPNghk07OyS5ZD0fUtF6LaqVbDAD/3sOYhZfR279g2DNEFmaLIt/fnCLyO5HNx9byJexrx1Q==
X-Gm-Message-State: AOJu0YyHJHwSMiZDtecR6I8W+rQMGdRQWacA/vSNE0fq1wBNeG8P0hO+
	zgQ7ERwLzgoQzRKiSMPPnkPD5ifgp8iEpBP/vaFF7mS1o2unMcJlztravtmNgcQ=
X-Google-Smtp-Source: AGHT+IHGDJwgvu27ZoxkF/Iz1RMQROmHIKs8TmuQAxLdh09B6CWq3+c9Jjh5o5EFESeTZQUuMmrUsQ==
X-Received: by 2002:a05:6358:418f:b0:1ac:660a:8a69 with SMTP id e5c5f4694b2df-1af3baf62a6mr2337848555d.18.1723020236454;
        Wed, 07 Aug 2024 01:43:56 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7b7654bf852sm6742435a12.90.2024.08.07.01.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:43:55 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: helgaas@kernel.org
Subject: PCI: Work around PCIe link training failures
Date: Wed,  7 Aug 2024 02:43:48 -0600
Message-Id: <20240807084348.12304-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240806193622.GA74589@bhelgaas>
References: <20240806193622.GA74589@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, saeedm@nvidia.com, linux-kernel@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org, mattc@purestorage.com, pali@kernel.org, davem@davemloft.net, macro@orcam.me.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tues, 06 Aug 2024 Bjorn Helgaas wrote:
> it does seem like this series made wASMedia ASM2824 work better but
> caused regressions elsewhere, so maybe we just need to accept that
> ASM2824 is slightly broken and doesn't work as well as it should.

One of my colleagues challenged me to provide a more concrete example
where the change will cause problems. One such configuration would be not
implementing the Power Controller Control in the Slot Capabilities Register.
Then, Powering off the slot via out-of-band interfaces would result in the
kernel forcing the DSP to Gen1 100% of the time as far as I can tell. 
The aspect of this force to Gen1 that is the most concerning to my team is
that it isn't cleaned up even if we replaced the EP with some other EP.

I was curious about the PCIe devices mentioned in the commit because I
look at crazy malfunctioning devices too often so I pasted the following:
"Delock Riser Card PCI Expres 41433" into Google. 
I'm not really a physical layer guy, but is it possible that the reported
issue be due to signal integrity? I'm not sure if sending PCIe over a USB
cable is "reliable".

I've never worked with an ASMedia switch and don't have a reliable way to
reproduce anything like the interaction between the two device at hand. As
much as I hate to make the request my thinking is that the patch should be
reverted until there is a solution that doesn't leave the link forced to
Gen1 forever for every EP thereafter.

- Matt
