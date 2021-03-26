Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A823234AAC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:02:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6QFF4szDz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:02:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6QDw0ptfz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:02:23 +1100 (AEDT)
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mkn8B-1m4bhN1bwN-00mLIA for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar
 2021 16:02:18 +0100
Received: by mail-ot1-f51.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso5524674otp.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:02:17 -0700 (PDT)
X-Gm-Message-State: AOAM532mdu//l3SotSEctHK6bAgZtnynCMdSIQAnrKEFJgvV2rUiFnw7
 582o1qsBMxf8oC23eph91yxUhFC9+b7RurEWkmI=
X-Google-Smtp-Source: ABdhPJxqEYgkhmmR9tlr6VhSmLMh2wsAkrBQ0kntrx/MKqJmvuyr6KcW6emNL2sDgGiWuPrMoCfra7yk0h2aPozesEg=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr12169406otq.305.1616770936271; 
 Fri, 26 Mar 2021 08:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143831.1550030-1-hch@lst.de>
 <20210326143831.1550030-4-hch@lst.de>
In-Reply-To: <20210326143831.1550030-4-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Mar 2021 16:02:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3PeMbrC3v4tGPJb+OpZYXHabe4UcF+TiBWF_JCtnwHkw@mail.gmail.com>
Message-ID: <CAK8P3a3PeMbrC3v4tGPJb+OpZYXHabe4UcF+TiBWF_JCtnwHkw@mail.gmail.com>
Subject: Re: [PATCH 3/4] exec: simplify the compat syscall handling
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MeV7lUjpB/Z4qcK87AgjHpQLHjJK/CYTY9YaZhQUXkdYXs4BbAY
 RebJ4XLLaGKkQ3XDJsKglpupSkSZBugyLtN7/P1cQZK0inc1x+rmQnKfPHPlirjGOQ6zBbj
 1jQakhO0dmZQXseFGkUrdQMib2EY00UB4evWNc0bEp8qVh8ThrtwxGCB4mmUaH0NkMSyo6Z
 RpoWDwKmgs5zhk9AmeMEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9wLP2dtZaUw=:U/i+aEsBWf4jT3PileljEZ
 /hlAwPBlHe9bMeLxAmmCxAcoRmjQBjCt/6KWFYFxE9YX6/b09UFfXKSiXz+cZ7VTT+Le4vLn4
 sdLFqP/Qx/9LLQfGqLgJWxhj3HNsfbnb9QDFGjsxf40KmS0CAur160Kml8yswfMuRuuoap4gv
 PEkYfRPJiFjgFUut7mtFdmZAbSnjQplSrjfu+PAM38zEHKo3BEdTnuSSrNDcFyr7rEpj/ACHr
 U98Dx3IBFDqKmdbEqCdSVhy7ebyhjQmmbvLpNqcCiUxGqu5jZuNwpWeN5To+TdzxpSaCgrCaO
 jD9WSFeTl+/k5S7vLrBYdGYXotWOYgnhPLPCe9Yi/zJ9JOxoxJkECuJn6Ne3Ivnxp7sMJhu/z
 3pzGnYkHUShRsytIYal1duDSaroksidFggwylcsaRqLGON0oDuSEUqM2et35YNIrTa9mhwJdq
 pN7OfGAo/Z1iCSh1cGhbnSm9y1+aHdO/nIw1SHWL3qZPc46+MHz3fGMjMSF1ul7WuukmMpEmf
 qGWF+3tPGof1FEy/4VgD3OXKEzDVNXqMdEErP0Fod3x3BZA1qqVomN+uAK61bTNsN4zdQtgF5
 Mk045vLlhZ+l3dqZ/EDuQtRblcaWC6nhk6
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
> The only differenence betweeen the compat exec* syscalls and their
> native versions is the compat_ptr sign extension, and the fact that
> the pointer arithmetics for the two dimensional arrays needs to use
> the compat pointer size.  Instead of the compat wrappers and the
> struct user_arg_ptr machinery just use in_compat_syscall() to do the
> right thing for the compat case deep inside get_user_arg_ptr().
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice cleanup!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
