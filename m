Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD84A3221
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 22:57:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmSpv36Bvz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 08:57:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmSpS3m2Gz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 08:56:47 +1100 (AEDT)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGz9p-1n0xQ13i2V-00E6fm for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan
 2022 22:56:42 +0100
Received: by mail-wr1-f47.google.com with SMTP id l25so17743221wrb.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 13:56:42 -0800 (PST)
X-Gm-Message-State: AOAM532k2vfKvYStEaYyIo+ZdQazPsTzJwUNxueXyQ6qwR+3nJI0NsEn
 suvLmtO/MyfD9pTxmybu5iH2A+OWrQFL81M71Ik=
X-Google-Smtp-Source: ABdhPJwc5Xijmfuq1knxS/SFbXOQYffcGfosuG5ZO2lbKDIA+jheKOcNNo8uA5Z4TCV2skF+ogyeNdBrzcg4f0zq/zU=
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr12082870wrx.407.1643493402481; 
 Sat, 29 Jan 2022 13:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-7-guoren@kernel.org>
In-Reply-To: <20220129121728.1079364-7-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 29 Jan 2022 22:56:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
Message-ID: <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
Subject: Re: [PATCH V4 06/17] riscv: compat: Add basic compat date type
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dKToKZ4aYeDVa+vMHk7FxXw6eQ5MFAOvAkkLFe5obeKeKD3Kr98
 38+xrbnKyBip47URe7kYvSxw1pHF+fe+TIagmkEsEyzFz3hUu0Gnga6WcSrtruC5VUv3Av1
 2T0VPOZT09fUI6JA1J6kq5f3yYUkT7+WoURjbQnvVLMAA+pKc3JhCNZAR/g7Dmvj3jUIowJ
 i8n4lFLck1jlBQBGH7UzQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lnSnXu3EVyQ=:a+hTj/aPjV7yIN/QNGojJU
 Kr2JWH+NG4DeoI7lndhhx59iKOmswyfYQm/7+6btfsCnk0xu6pC1uqHI6LeAFCfwN3xPH9XCP
 ObE70bB5dYeHl7OYy9R+mFQEyKcq8syraMwgW0mpfrxB1AaXkvedY44BJ+EH1U1U5nd7S9Wrb
 prFRMZKYiYzFb2FtvyOsH1Kxu7XAFblMb2tFn6OR0u1M9L8qlXOsI9TXchJ5TLKiopjmFERpk
 PqQqBhf40HK8PQMHslGbNkNbVrpn1xb2QQssP3IR03kwwA5p7/Ee7ISAudXWxOk1cyUgKi6BW
 uB30DS7bnmWF7qI/8H5WA/0OX6LqcVuM9Dmv16betc4rb+4RGyXElg+QAANoM/F19kuMXsvu5
 a6t2m1LrZhvjhWDDAbuck1+h4RftcoRgsYAJVU4WiHTOOJRqx6Q36xEn0goJOWDAB0FX/AIzu
 gDNdQQ63urdUNJE2cdPHtZ/wF9mOv4ETBUgrXyPekm+ShYmi+rtGkSlGiHbDrfpFv/w982/9s
 3nZXc2R04ciUTDJA50qirZ4uVMX+5zIuf3iPJg+AqBgiW0UudQAmQTUe40s4yafpzoyMx4O1t
 +SGMVkHh+314J78k00r+KzoUhg7R23rO3fQOZpZYYyq9ZMvIZz4pD1yvH0gQaMEFabSSFxAeu
 i71HpEgOOpWljQjC9+GO5KiLXASXXX0GVxXqKfZbyTZboBQ/vB3bRSXbdYTFTJ4ktGQf1OaC3
 Rbpmgy6X7nxjBG5xgzHI685TOH6TjnXiyeulzwpEaO5cK2iwcIXC8PIBs2JOxwsLG1vKinY1Q
 5c/6oXEmGE+8F/eDBCptvq2X5/Gh/xFEMHky3QOn2OS6pfVyrM=
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
> +
> +#define COMPAT_RLIM_INFINITY   0x7fffffff
>
> +#define F_GETLK64      12
> +#define F_SETLK64      13
> +#define F_SETLKW64     14

These now come from the generic definitions I think. The flock definitions
are just the normal ones, and AFAICT the RLIM_INIFINITY definition here
is actually wrong and should be the default 0xffffffffu to match the
native (~0UL) definition.

            Arnd
