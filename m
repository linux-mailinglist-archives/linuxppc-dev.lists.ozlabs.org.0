Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E563634AB21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6QTJ6f6rz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6QSz3LRmz30Bp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:12:49 +1100 (AEDT)
Received: from mail-oo1-f52.google.com ([209.85.161.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfYHQ-1lsF4Y0BpI-00g0DN for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar
 2021 16:12:46 +0100
Received: by mail-oo1-f52.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso1368265ooq.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:12:44 -0700 (PDT)
X-Gm-Message-State: AOAM532Gp81auAoQbbFqGAsLyi5k5zdkUexOkSG+AeXdis/ZJcklAzjr
 AyUO15fB/okvVAWye4DyaEK8kdEt41ESlFy9w68=
X-Google-Smtp-Source: ABdhPJyncRM6kyqeo61SxrePQvXeSUHXpMpeR3setGvzuR1f3RkPXPWDzfhUQ5b18mmh4AOwFayrXC4U1BBAx3fFL7s=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr11801529ooz.26.1616771563972; 
 Fri, 26 Mar 2021 08:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143831.1550030-1-hch@lst.de>
 <20210326143831.1550030-5-hch@lst.de>
In-Reply-To: <20210326143831.1550030-5-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Mar 2021 16:12:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3jQHHwxFw4DV5+c0Nu61TsxqL9vRoAga+yjz_U-iXxvw@mail.gmail.com>
Message-ID: <CAK8P3a3jQHHwxFw4DV5+c0Nu61TsxqL9vRoAga+yjz_U-iXxvw@mail.gmail.com>
Subject: Re: [PATCH 4/4] exec: move the call to getname_flags into do_execveat
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DbajlyCkUYy9vHuAb0o62XsbChwJIKDNoGR7cfPyGCpNYveUZSn
 noB1YzdvJZ7Bu9ltRDz4e1R5Nd7gOP9PXoCmc1mQ6p6/JXshNMEMENnQVcNPJr6IUQM3pE9
 9gvhMlleZqjiz+b6gIOtNZiWj3H9HGbjN2Dbp/UaJfNf5VQ4WH1hj2F96PM3YOiGC6JlmVb
 cTPZ3fc1qDSpP5Fpk5pyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Xg1rb4w/vs=:e9i1FO6DyB+lCeofN/owNz
 mWkZtERIkhMdPw0WMoIOmbAHkw/EvuG54y/6OKTaTomD5FeZIkhRxO2QHflboYt6y6V1nx84y
 8iyWnMHFkUtrJOWfsfzxXuvkR1QGLfaGFlj2MLzISxri0m4KH73UnSeQxqgv4HTAMxSf0J1uX
 mutrA4x5G08HJyTCikVjzyOpPeorTmaAhSVy0EGGqbfsMqFNJ2if4AN6dqjQEvUb5KIzxH/Yj
 H4rGINjN5IPG3EiP/zolDSfzCxjBOaTkJcPcIBqGs3Xq3gBaE2BAXrphhnAmGS2xgN7IlzoAS
 bHPmip2+wNcSTgtPJWcRmoG3T/szCNlVd5udPNuzITyA7sd5oD14Y6NXEPX2cIjZtNleuk09F
 YjTyb/FdGRAzwWwPO14mByt3pZIJMvZyThANkjn7rLPm/2adDIZHJlQS46UEDAmiZAKRJ/tsR
 SNCU8bKDZSYPpA6/oRcJ6LRJ6YyUmf1SVOO0Y6VfNtbIcPJj7IC9JA5Q5T/wPEpWJzsEtjFN9
 8nTFAzdVloNv6eK5wnYYZSlnmjhxBakqu/br6pmNONHYfKJc8BXdOYMcFJBrb0XLt5V9V4k9F
 3GPWNVBzMk4yvGP9Y2kFGpI/BQm2zlLJej
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Brian Gerst <brgerst@gmail.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 3:38 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Remove the duplicated copying of the pathname into the common helper.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks correct, but

> -static int do_execveat(int fd, struct filename *filename,
> +static int do_execveat(int fd, const char __user *pathname,
>                 const char __user *const __user *argv,
>                 const char __user *const __user *envp, int flags)

Maybe rename this to ksys_execveat() for consistency now? I think that
is the current trend for functions that are essentially just the syscall.

With or without that change

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
