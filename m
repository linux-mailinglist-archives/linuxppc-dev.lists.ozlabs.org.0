Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22F4C27A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:11:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46b50NVDz3g2R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:11:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46RG4N6Qz3fK5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 20:04:26 +1100 (AEDT)
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCbVD-1nVAXT02TL-009fKS for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb
 2022 10:04:24 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 o62-20020a1ca541000000b00380e3cc26b7so850968wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 01:04:23 -0800 (PST)
X-Gm-Message-State: AOAM533vAiRCrzUky3Qx/9b0ExRInikWJJeK6RWoOsEuqSqs7LIFSY1H
 Shakwjgj0KpvbEFClcRa4CxlQx+q5kiraPx3jmQ=
X-Google-Smtp-Source: ABdhPJyjEw35XhDO0nptzAMVKk2Hxde9tm8LwW6lNeB58GkA2TxxKPLSRkO1YZW5ApcDqUwIlDhAXRFgLJ95HKAPDdY=
X-Received: by 2002:a05:600c:48a:b0:380:3f3a:e08e with SMTP id
 d10-20020a05600c048a00b003803f3ae08emr10577359wme.1.1645693462887; Thu, 24
 Feb 2022 01:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-20-guoren@kernel.org>
In-Reply-To: <20220224085410.399351-20-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 10:04:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3vmB4Vm9UOHx3qnTY6wUyw_r3R11amYwyHNpEhFiknrw@mail.gmail.com>
Message-ID: <CAK8P3a3vmB4Vm9UOHx3qnTY6wUyw_r3R11amYwyHNpEhFiknrw@mail.gmail.com>
Subject: Re: [PATCH V6 19/20] riscv: compat: ptrace: Add compat_arch_ptrace
 implement
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Pco5YaHqFdGnHZHIgxdcLS3QRoCNiT0V+dfVjnmMkd3gtQ7oGIt
 EtNLX9Vs9q09JXB0jxYaWgNUrxENoFmLxNx8CBypCSb7JzuW8Z3XEltmZXrYG+1Kj2ASBJb
 TAd0eVcK/9GxHxRagfK5XXVbRu2ayrdSih6bH+K9eYUojh2OXVUHURMfH32AR+cJ3xHFIj8
 rQuoF+46CGh+0ujqcyvtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T5RqAVjw1bM=:2RP5EEl2mTuwPeEEigpnmr
 yBnVPA+rwRCx5yYfRtHv/2XXXta7cq/+cwyvbO4ahJ5FZRPyyaBDniembWVBQCuEmDpGveykw
 t/X2OlOVG5PW+s26oNtScyHbJzDIxe0kg7xXI0n5wtfXfEAmApfXRCRyChEDis0oZmLjyi8uh
 TpIk3H2aG/ddcNSDJMsxPhT0dhoPAsn14cV9SxS1+wAjCxLxQXErx5l3nu5FWGAXEsA05d0MG
 uLrYYaaa0Us1rr19qKUI4aH7Xi+56SrwogWiC/jW3J7lXQ4+VmxIx99JYsfkDRcq83sqMgDIb
 Hus+fCtCmPdHqttWpRQcVCPlwd9B/Q+45f0kP5TyorNOt6/cKkdS0kUar6iGQ25Ts/FdM9fzQ
 gycvm/k3UTWscHaMaP7vwPsZ3NjH3f9gyINTx8V6u0QcANLmpZAUARQYuUD9ALzpuLN0FyXo6
 I0k66+vGjJeCmDY+SNMJS2MZiA6i0ip5GX3rWg7uTb7wsv2ERSfd2lZxkzLUkNHX7Kol/rzxK
 TretLRla7ZnEh1yQPWD0f9PLBtn8fBZdKQCc+xiXoZsxkqMeUot7cqxqetSpVJdEWeK9pFr5G
 57Mybpena1n1IgYHpQfXZ1aSe9nNBmhnVen22JdqWn/ht6HmYU5KOj7kR7HJJP5zAHEpLf1KK
 zz08VW+ZKSuDIeOSZXw0lk4sJCvcUlTr/2x9DAysCJmg5y6W78BFQX+Ne4Np+Da52PMTNPzHu
 MKVjdTXzfJZkgOvxcL7fgQo2vhw64yL091CGgN11H4LzmcEZ1vRWe6lPJTr8G9Sv/GAO2gAW+
 B1fkLhcPS7RGycFsTjwnEk6GLv4f3kQBz2TRrhx0aSoGMn6dQk=
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
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

On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
> From: Guo Ren <guoren@linux.alibaba.com>

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
