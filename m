Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FF48B135
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 16:47:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYFSH3mQJz3bbT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 02:47:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYFRm2w7dz2xF1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 02:46:42 +1100 (AEDT)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MC0HF-1nCVUY0Cb7-00CQv2 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan
 2022 16:46:39 +0100
Received: by mail-wm1-f54.google.com with SMTP id c66so11346190wma.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 07:46:38 -0800 (PST)
X-Gm-Message-State: AOAM533j38LEjaQa1hWnMO2uruN8UACXt+WOVmYISQ+p68jWEtNyGcvk
 hEjnYV2RpLCtOqT6+vn0TK6t+tByCyKAW8A6KAw=
X-Google-Smtp-Source: ABdhPJwB2xKozQuCORkKSCQAL8ClRXdu0xcIO+JF0MBbhis3uIel6aCgUYRUOftHzuYWMBNA7fgNkNtxR2C9Ihxf1Yo=
X-Received: by 2002:a05:600c:5c1:: with SMTP id p1mr2988726wmd.1.1641915998117; 
 Tue, 11 Jan 2022 07:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20220111083515.502308-1-hch@lst.de>
In-Reply-To: <20220111083515.502308-1-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 11 Jan 2022 16:46:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2nY60Pgz1Q0YJ-bMsJdJfFNw8q6R7R2WzPCj+tVdA=+g@mail.gmail.com>
Message-ID: <CAK8P3a2nY60Pgz1Q0YJ-bMsJdJfFNw8q6R7R2WzPCj+tVdA=+g@mail.gmail.com>
Subject: Re: consolidate the compat fcntl definitions
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7blCCKvPkVrYldPprMtFrKW+TYu5Hokvqok0XfsHyZo4VFsDLVj
 hyZQ1CoAYDUgqDf8fAda6EDXHhVHzx5bJvEBI9IeX1IfQ5zSqQtFWwHo90vi4p5toobbh9P
 U5EYPk5EpN7H4d6cm3/iJZfzWzLdIxbTDqEXT72wS7JXJZajvX+H1Hg9rEdbspgT6uW8sAo
 JuPGpZwZG1khpP8LnvY6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hm67eUYYihY=:k2JhG6IpwTW94irp0e+Y1z
 XJ7baXnFRXcMvOP2wqVSV+o8U0aXxmv/mxLAx2DriEcqwfZGS6wSg1MThoG+rrWYmGAfzTLHo
 Jqlf2i42jxH9kyDtdhXoZahsxufloSeyRGT5XlVNa9iV+E5AEQDpmq/lwhZFSnKipagsqwioA
 yuQs9HHjq0IN89LxqKlt68j72z5lQJllxH4y5sVuaJiONspKzIdow5JVr6iuF/RlQ2Dr54O4i
 sfVu3JmjlBk6EGsf9YburxBNPRv6ZTEQQbxrouq0k08c/mQa1e/5uKa0UaF9H45qaexcuiOa/
 NRxSgRdkkYOxNQA48bU7lM2sr4IIyordyaa77RuWKGvD4OREc6FkmALUglZa2QZCEaqXe8BvQ
 2c4wPd6pY7R3gzBBFn9pcGJFXtg66VfxiRz+habAYBO5ydWFPaGOGq2Toa5uWGkRNkRH/VN9W
 knMHdqpAskMSoRppyjGe7obBdBAPrMbGa54wPmg1JAobpQN7877+nCm+JA/fweYreWibzsQ3z
 ld9RESCI9FSakbqHy2Z5+Bo/cftzqt7dUHypZEyfN5PHalJOpJPy97FTholvqevNA7y/XV7cc
 1LsqsTHMEjkIaPLnxibFSaGmYSs52+qBM0L0BPMKD1i8JPImX5QoyWXHtUiyQvXeXNQCCc1Ev
 w3j2hsVsTzWiXEQf2rlGryFaF4/ouafaWwgboUxkiIvhX3z6yKlKP9glmv0hBi/1oaZGvC3o9
 i8/K+RZUS9bF4tcM/wUbWprYcnR4KdGcehfasrMidBZTI7A8F4TMhekEdyHCy1YY8faVi4twe
 Nb0ytdwM+03VRBLj1oqiMPVh8uTncpMqEXk6Se30Uv9Ff9GFRA=
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
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 11, 2022 at 9:35 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> currenty the compat fcnt definitions are duplicate for all compat
> architectures, and the native fcntl64 definitions aren't even usable
> from userspace due to a bogus CONFIG_64BIT ifdef.  This series tries
> to sort out all that.

The changes look good, but I have the same comment on your last patch that
I had for Guo Ren's version. Once we have resolved that, I can apply the
series in the asm-generic tree, or provide an Ack to have it all merged
along with the compat mode changes in the risc-v tree.

       Arnd
