Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2F4CBA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 12:18:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TySN0MlzzDqG6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 20:17:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o2+Jg7pv"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TyQK240XzDr9S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 20:16:08 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 145so1342087pgh.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=r6MuAgpb0/2lJz7pVstqe3eWs0/BwcCgQyz1KMoDRzU=;
 b=o2+Jg7pvZhjcL+DDJKue0KURsf2/TOoCdCBBgrZJ16BHGrLN7F6dardFJAIuZMHsjH
 3NWd4XyOTVBICM5+15b9AxNyx+PhbV0bv2O7nMl5NPm5eZh4ayT6AkZ5sjun7vMIsWKw
 N0cin0wsmIQgUmgzrondJzbBknZ65H1xH3G3bvH+25Qh9WwDNXtx9rBewwtLUH3uN9Of
 dssKR2CoTivLIBvH3/05Zic6SCU339rrilWE95FfyP9/lF8NoARa9+76hcd/Wp60mxXM
 wGSJYZdZucM/P7pzhhYjuYCMGfS9egtH/GWT7uUsRG1vR7COJlmOMMcSIV0RpF4kGO4h
 R+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=r6MuAgpb0/2lJz7pVstqe3eWs0/BwcCgQyz1KMoDRzU=;
 b=uZDkUuDTfQZgy6BHI8JSoChgSJWOmrFMTTSRCalwENS9hwBTNZadPVN+afTVAtNhvS
 D2WoUYQjhaKwBmb1VTZZVO8XM/Nnju56uo+NNXLUsxgMpuvnfh/z2iK9f+P/VmyrV+uE
 ytT874+Fy4zP4IVlrj1a2k9c6AYdsXTqNmq0SDGasgGmH0lSPD/xwoWRFQa/KSQtQetH
 phkxPVsM1Z67LMv+KgIqJ02tn0Wq/KQaga4U+O+ro6SXuQklLUJUYKiW5CVfAHT47xtk
 5kfzUDHEW8NKlcce86LinrsGKHNOuObOJuda+FDsjGoDiFaR5/E6p827f612MFVZZAVl
 P4bw==
X-Gm-Message-State: APjAAAW4zQfN3XxC1LoxX2zpKlMUaDKzLwmUN1uu0EruyZSdPSENmlKq
 p8mhxEw0BbNK2z+kLDAOcQjA6clh8/s=
X-Google-Smtp-Source: APXvYqyFY3Vfy63I2tdPgxGfwA5K3Ut78PQP/xZI1LYN/3PfMdcpGoki3ehveLZpWNAcTmOEcT/kRA==
X-Received: by 2002:a17:90a:b115:: with SMTP id
 z21mr2315020pjq.64.1561025766936; 
 Thu, 20 Jun 2019 03:16:06 -0700 (PDT)
Received: from localhost ([203.220.63.126])
 by smtp.gmail.com with ESMTPSA id c133sm22498288pfb.111.2019.06.20.03.16.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 03:16:06 -0700 (PDT)
Date: Thu, 20 Jun 2019 20:16:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 43/52] powerpc/64s/exception: machine check early only
 runs in HV mode
To: mahesh@linux.vnet.ibm.com
References: <20190620051459.29573-1-npiggin@gmail.com>
 <20190620051459.29573-44-npiggin@gmail.com>
 <20190620095329.rvrwxgtjsgkc4k5t@in.ibm.com>
In-Reply-To: <20190620095329.rvrwxgtjsgkc4k5t@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561025688.p6bobskuv9.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar's on June 20, 2019 7:53 pm:
> On 2019-06-20 15:14:50 Thu, Nicholas Piggin wrote:
>> machine_check_common_early and machine_check_handle_early only run in
>> HVMODE. Remove dead code.
>=20
> That's not true. For pseries guest with FWNMI enabled hypervisor,
> machine_check_common_early gets called in non-HV mode as well.
>=20
>    machine_check_fwnmi
>      machine_check_common_early
>        machine_check_handle_early
>          machine_check_early
>            pseries_machine_check_realmode

Yep, yep I was confused by the earlier patch. So we're only doing the
early machine check path for the FWNMI case?

Thanks,
Nick
=
