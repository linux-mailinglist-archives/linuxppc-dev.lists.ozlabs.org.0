Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F96550C8CB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 11:48:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlmgV1nysz3bsD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 19:48:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Klmg36J4Gz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 19:48:14 +1000 (AEST)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MPowd-1nU7Sc2imJ-00Mr7o for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr
 2022 11:48:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so6696608wmn.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 02:48:09 -0700 (PDT)
X-Gm-Message-State: AOAM5316nTTpUu0yLtF7qDmeEtu6w6xNL6u/B1LV5dqiEIsFS8aS1EZg
 lIolgjYzZTGN3683ElmBLICXyEpj29rvvnvmj8A=
X-Google-Smtp-Source: ABdhPJzB571QS23ads9/X6bqp8kn5uvfGAj6Ip74WQj7sqmxjMCA85CiNrM4H8Eqf/GMMA0WHQ6q++BsxTECp2b2his=
X-Received: by 2002:a7b:ce15:0:b0:38e:b7b0:79be with SMTP id
 m21-20020a7bce15000000b0038eb7b079bemr7890160wmc.71.1650707289338; Sat, 23
 Apr 2022 02:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220421070440.1282704-1-hch@lst.de>
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 23 Apr 2022 11:47:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Tw+fdf-dTKfu+aFFv010u50+LhiiVBRRujfSFNrqbEA@mail.gmail.com>
Message-ID: <CAK8P3a2Tw+fdf-dTKfu+aFFv010u50+LhiiVBRRujfSFNrqbEA@mail.gmail.com>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:s2hQnQuFKrOy+bkn1JiGyenncCksbQbbbERKAITfgIGxOPyZCbB
 yxuV7ym4Mqf3WD/Rz9Vt8a0bvl8YadrJbYrE1vliShOniQPio45nbi9Z8PPidTZt0OYEHE1
 8S539KiQ/GSXD0rsVefVs+7vwz8VQv3yOd62vC6hfB41A9ezz65pBZmvpz48LLsKFmtZT7/
 ByzatkaXvbp8bk6FeKmxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nvDZDcKtkfM=:KVPdY8BL73fhM/Ls1c00w6
 1BcMHxaiQCSsvZ0rpR+UEpx0SUOxyiqeHuGgSUGvwwIVTn/rGrfH1eaccvpTsw7PesuYs8oKz
 ofQihZF/MEZCLl1rjVikgkFk61Sxd4Pu4L/QiCn7M0atKspta2GqqS0iWn8cBzxJ0rCkAPrU+
 67eoT36gSIlm+EllwtkIEmICYd56tPElDR2RwzWNcPwFL0oJ+MD6OmgnpaycQAVdVKp1Q59uo
 x2FnaGnX1pjWiugqarBEVujy7p523Y5z8YlG4RN/mgBuZ2ItT/IPBd3laVFmtasMfnGFJLh+y
 Gx6dWoGnenY5NeNpmuVb9duLGx0ciLLA9Xx4j3VYA0dI/YxV39vB+KWFUUKhWY08DDW/7e3Ij
 7TudAADNrgqLt71aOe5Klo5pPSrmy8GbeI2Jc5AtFhlvaO0z0R2tf5qjCj1Krf0y49k1aVeTX
 4EfA6z9SCw2p3IFxNsVbb7BxQCGkqOJipUtAKcfTsEYEjVelCjbpANhYU5wq76sT3gYqXZs5b
 4C8otbBQ1wnygDOGCuxfw7xBdO+cc3DkTIpz/0Wq7GxUSrktD7StLHvafKkLmemPN7KUVGC70
 tAAzvCuvcJ+DnNXM+Hg/z0zsaJrZtj97/djnTU7O1EPehV2el2LlcVPpEsbN4HM06vUuA9GgV
 P35bDzs/pCMLm7pYKoCxzIlnRcfJ/ZrB9tkTfqdcnZsWggFlvX/H4uxBvoRTOwC7FeGk=
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
Cc: Networking <netdev@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 9:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
