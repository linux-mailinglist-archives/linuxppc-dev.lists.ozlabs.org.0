Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D710819F73D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:53:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wsTF2XjhzDrJf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:53:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrZC2BTjzDqtl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:13:06 +1000 (AEST)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MEmMt-1jVahp2edv-00GKvH for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr
 2020 15:13:02 +0200
Received: by mail-qk1-f173.google.com with SMTP id o18so13180358qko.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 06:13:02 -0700 (PDT)
X-Gm-Message-State: AGi0PuaBIIbqtmKTULFVC7Hg6geHFygw6pm6YDOows8Skj4pFn/2dOF+
 RQBsZz6SjGhXHj64eRpPm/5ykG5lIQ8fsmC7nAc=
X-Google-Smtp-Source: APiQypK8zqZk5uLnoIubAdQeJgGTiVyPkpSzxxqDGQ7EZ4yy/nSPnZICKVDeK2bBxoQfBZJEyLjW+qUVp5bYDvV/ciM=
X-Received: by 2002:a37:2714:: with SMTP id n20mr6302088qkn.138.1586178781557; 
 Mon, 06 Apr 2020 06:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200406120312.1150405-1-hch@lst.de>
 <20200406120312.1150405-2-hch@lst.de>
In-Reply-To: <20200406120312.1150405-2-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 6 Apr 2020 15:12:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1YdCuChb0mOU1+27PHK9qK6NGkuKfrHQa4LC=1LZmPTw@mail.gmail.com>
Message-ID: <CAK8P3a1YdCuChb0mOU1+27PHK9qK6NGkuKfrHQa4LC=1LZmPTw@mail.gmail.com>
Subject: Re: [PATCH 1/6] powerpc/spufs: simplify spufs core dumping
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MVHMNJVbot1x+2RamT4BheYWQ4BV8svB9PbcfLCTJzAUPcti3F+
 zaZ2074mRwwTlDFCod9SWB3z08TWFB0CZ3Sxzj+14EEYipIrufzu6j4gQLVjjIDCSzYSrZ4
 zXmcrObI0cY36AW9YV7G1WewQX1YEpbqJ608rGpZk7XQD4YnpY7z6/tl3gk8pSnBczVo2ws
 BNRs3VI2fWEsRtFbM9UsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kVAC9ct4C8M=:e8V1jROxYphQEURklNLK3u
 UY1cErNbNZnoaGWJvY+bwGjz8wnEd5VDMwEldPw862QwCfX5IMz6DLCoCo90YQax+KDZzjWFk
 1klAcc/3hl5w0JTT/UA1NsQkm+w/1DjCCyFkZtnIokzQ6SaRX0xC54r3vVlhNABSLaPgwISMl
 yTeyTV5LjVZ9IuKyUUeSk51xq+IklHEMUU0EDbgKtkegoHHCm3w0k8+sWCqAKBUkgOTae2vFi
 QhqnZPKCZv+5IELf/qPr9ErELrbE/eaJkHiTzvBwwPppjWJSKs8DTUvsTwJdiCn6tHslHmRws
 6BlalfDjEy0PXqWPiPokhcdbRK34od0NZ1Qw5/6LEz2w9SeBspZmiGwcleTmTQn06TevwXYPU
 BZnZ3C4B+AeyTLu9Zj65fjh70mET9XfI0Ls+RjdpH9jiPVtT6vd7DHnbddOOWUarjCViXSpGv
 Odbb1tNdPiM5lH9coe7p70z8eWRxFcBr04WmFfO/LKeuj8vcC3XO1oEWSDhId6JTCzGgX5cif
 M8nriCv4ndeirKHeCrbsq92Wyy2FDAlqeNjmJoEFLxpQB1SydtbBMCjTjD2v6qRK8JhYbFzAj
 z2ZhIkJ7M+dWIv7wknMTsrXZTd7eWghphayZeHDgC5ndj3eqAVd6v29oBi4ZgOi8V+sbuI2WS
 +2bYNZdwgZxlqAi1pFk0t7tOxe8Ka2snMwrk1HW4c3STiL1Cl5TdFebZLlKFQwTAr6Ua3tYWi
 ffbBtC5JwImPNUwewJa1JFPLyXSOPqpyNn2J4/W4+XL6wMhljmaj2Uba1rjdrQxvXV/aT1eAR
 Vn5gODNyJh1FwLOfCTsRQNz7OQwWJzarLV1q7WGrIFrlXySFog=
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 2:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Replace the coredump ->read method with a ->dump method that must call
> dump_emit itself.  That way we avoid a buffer allocation an messing with
> set_fs() to call into code that is intended to deal with user buffers.
> For the ->get case we can now use a small on-stack buffer and avoid
> memory allocations as well.

I had no memory of this code at all, but your change looks fine to me.
Amazingly you even managed to even make it smaller and more readable

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
