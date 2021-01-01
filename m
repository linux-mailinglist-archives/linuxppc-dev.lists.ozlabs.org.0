Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E12E82B7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jan 2021 01:47:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6RF34ZdfzDqMM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jan 2021 11:47:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sfRrPJxX; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6RCW4802zDqKP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jan 2021 11:45:58 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id 11so19152707oty.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Dec 2020 16:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=r7F+5zFPcVRKmUB542gaVYo2nDNVCRQhlyYt/hsxXr8=;
 b=sfRrPJxXgq5krDComVtlUDJba+RuLbKgUq44zyoSZRdAkebHE/65iK7LFK9x5swLLC
 1sqR0SV8gPdeb9p1VDmDtB9P90WyokYzp1yururMDAJCl1HVrf+/+nGpWOHcYy5qteUD
 F8N26M6vKCj2eYq8GGz9wFVLuEHa6OeZPG8GFQ2CJBfQuRjzXSGKiRaiFbYKSDaVaOgW
 snNCmdYZwApjnO/CGjbWI6bVro6zYR1ig50T8KU8wBs0MwznHZIB/WEXbChELkkPEgfb
 qVkwIgZF1am6pTdJMEgCw16Y6bwWTzHEzLiBPK4RvoH3oL3oh+wY3Fsp3Aq7DshQSHfc
 nbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:subject:to:cc:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=r7F+5zFPcVRKmUB542gaVYo2nDNVCRQhlyYt/hsxXr8=;
 b=QpzjH666mt37Vmi5n0u4cjlG5/rS8HAeM/nQIA5VLozDzBx9QXK+PdXNHbsiVX8HHP
 pxOsfzcUgRURarj3ei/I+H+F9ubIDft3NvUNw+c4IitO/BZm6i5grzbn04lwHrv+E9E0
 oRkB+31fwiFZHFhYYUEd2IVPfV6VlqMxpthdp7IPWLY576W5ZwIE6gAH5KspvaXXTx2m
 NY1mc9sY3wzSLoA0HhpEt0F6+tNUaI96QLa6I1JSuRquSAqh+HGuDb+1sgdawi/Omxfo
 RScDEpxi95kcNMt/VXPCeFjPyzyd38+79PdoNJEzLQC4DTP2QKd+FlZrdZmODvy/GBZl
 cYAw==
X-Gm-Message-State: AOAM532gCdgGmYV7sQDezL8H0AuUNPas+qNdjsbbtR4IOZvNEGl05htL
 6OfB08lUFICmpV5KNrlFs+GLg73nvio=
X-Google-Smtp-Source: ABdhPJxTEnYA5hUQ1SV8R72txJN3q6YQeH1e8JaLpcppmB6RM0cwORyWhiqMOSU6EmgCD8TcO+ZLhQ==
X-Received: by 2002:a9d:6f17:: with SMTP id n23mr43898374otq.371.1609461954527; 
 Thu, 31 Dec 2020 16:45:54 -0800 (PST)
Received: from localhost.localdomain (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id w138sm11278543oie.44.2020.12.31.16.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Dec 2020 16:45:53 -0800 (PST)
From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Regression for 32-bit ppc on PowerBook G4 Aluminum (bisected to
 commit d0e3fc69d00d)
To: Christophe LEROY <christophe.leroy@c-s.fr>
Message-ID: <04289c09-50c3-26f8-26d7-f43975fbb76a@lwfinger.net>
Date: Thu, 31 Dec 2020 18:45:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Paul Mackerras <paulus@samba.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I tested 5.11.0-rc1 and it booted OK. My problem is fixed.

Thanks,

Larry
