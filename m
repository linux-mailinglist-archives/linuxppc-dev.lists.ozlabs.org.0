Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DD91CBE98
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 09:54:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jzwk1dcpzDrB1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 17:53:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jzv75B8gzDqdS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 17:52:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vHrD4CHW; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49Jzv606Kbz8tT4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 17:52:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49Jzv535KBz9sSt; Sat,  9 May 2020 17:52:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vHrD4CHW; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49Jzv51Yhpz9sSc;
 Sat,  9 May 2020 17:52:32 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id v63so2188023pfb.10;
 Sat, 09 May 2020 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=et7vVa6boEWt6vofFVn9GGP7JXJcwn9O+OcQpQL6oWY=;
 b=vHrD4CHWA1kjdTUP7aM6xcbBSWlfOx8Ce2PdFJLMo8e4TIx+E5mFDOafPg2XXKuru4
 yhpIiU9FLeoGwv3UTmZGRWw0RiETkJTJHuxrK/3p8S/rCeGcb82hyXzkKOpFJTHfCvQV
 i9P1BXrFPfxTJyZtPTwlEX0V9GwcM9yC4YM5HzX4SIqP1WJZ2guIXe3/ejEY+S2vg2Yq
 Pfkh/Ac1hljAc8OJpcaBcG8Iv8U1BXdUP1zkK6Vpx8yZqTvC1xeLT3SB7qClX9hKD3J/
 AjOSje/sJ6jYEf6DOc7l8w6+cRPvsih1DC9awL0t3/4/6a9L8RrBN7NeYsAlqTs/pyEv
 QwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=et7vVa6boEWt6vofFVn9GGP7JXJcwn9O+OcQpQL6oWY=;
 b=XlsMveCtJ0TjesWyfwcCehi7/kyifkDVzVH2sIo+Ul9+XBURJ/KJKbuGpIDRQSWdBd
 OsDvJ1AAn7NVV9/ekJQJgQ6lpmpHeHx1bvoguIiE7Yc2+pFwlGKhAPPnS/Zd8uEULwMk
 k4TVCdqT4+MM5AORUc5iz/kbtwQBRLRWUHlAxpnF/Q8H+S33ediopnNt3b+hTJ3xNZcn
 WBWOSAf69EIJt5g/KY/kPDdrwfbHuPLOpNKrvg9DCH+G4pWL91ucieC54Y5OyXi/4YhX
 xqQZzHV9VHjDn+f8145677/Wwh86TB5mES91WjjsLn+8X3m4dvTGvPQ654g6cFbTgVOR
 70uQ==
X-Gm-Message-State: AGi0PubBT65qAGaEVhNVuZYhb5fzdUwwF1WZRh/fEOSEEk+cxH5KRpu8
 3F03T1zXJUBZZWq6Ea2NJdrTWcKN
X-Google-Smtp-Source: APiQypJNv9Owr+u0TewtbhokIX7+JmfXAhCuML1X0k2EV0noP7Hcdy6nHErZ6rz3TMNltKjBUW6Bqw==
X-Received: by 2002:a63:30c4:: with SMTP id w187mr5532663pgw.276.1589010750250; 
 Sat, 09 May 2020 00:52:30 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id r31sm3011610pgb.52.2020.05.09.00.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 00:52:29 -0700 (PDT)
Date: Sat, 09 May 2020 17:52:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH RFC 1/4] powerpc/radix: Fix compilation for radix with
 CONFIG_SMP=n
To: Anton Blanchard <anton@ozlabs.org>, Benjamin Herrenschmidt
 <benh@ozlabs.org>, linuxppc-dev@ozlabs.org, Michael Neuling
 <mikey@neuling.org>, Paul Mackerras <paulus@ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050204.GB1464954@thinks.paulus.ozlabs.org>
In-Reply-To: <20200509050204.GB1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1589010661.v7yharjogg.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of May 9, 2020 3:02 pm:
> This fixes the compile errors we currently get with CONFIG_SMP=3Dn and
> CONFIG_PPC_RADIX_MMU=3Dy.

Did I already fix this, or does it keep getting broken?! :(

Anyway fine by me if it's required.

Thanks,
Nick
