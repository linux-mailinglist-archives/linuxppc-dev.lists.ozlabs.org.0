Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B916276176
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 21:54:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTQx296pzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 05:54:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTPN39NNzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 05:53:11 +1000 (AEST)
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M8hIl-1kPJYm0Hmj-004oJF for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep
 2020 21:53:05 +0200
Received: by mail-qk1-f176.google.com with SMTP id 16so981330qkf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 12:53:03 -0700 (PDT)
X-Gm-Message-State: AOAM532tIyCy6vhhQGXOapKf6BS8DH4YkBiMzjmteKuuAWqcGtRd1+w5
 EGZ/rJOEKo/nEMDKXK4HNl9E0aGz/x/58IqKBz0=
X-Google-Smtp-Source: ABdhPJw80vxbxwT0bQ4Vkw0aE+k6Uuv2/dRNGRP/PGmAg2m3M1syddgA8VQgAKVqDM0S7SkWa6ZTkZVQ5JNt1c0Eq1g=
X-Received: by 2002:a37:5d8:: with SMTP id 207mr1587539qkf.352.1600890783036; 
 Wed, 23 Sep 2020 12:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-6-hch@lst.de>
 <20200923142549.GK3421308@ZenIV.linux.org.uk> <20200923143251.GA14062@lst.de>
 <20200923145901.GN3421308@ZenIV.linux.org.uk>
 <20200923163831.GO3421308@ZenIV.linux.org.uk>
 <CAK8P3a3nkLUOkR+jwz2_2LcYTUTqdVf8JOtZqKWbtEDotNhFZA@mail.gmail.com>
 <20200923194755.GR3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200923194755.GR3421308@ZenIV.linux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Sep 2020 21:52:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VPh0ufiUMbcRuj9wrpqojzQ_8mO68Vjc8yzLGxVNkpw@mail.gmail.com>
Message-ID: <CAK8P3a1VPh0ufiUMbcRuj9wrpqojzQ_8mO68Vjc8yzLGxVNkpw@mail.gmail.com>
Subject: Re: [PATCH 5/9] fs: remove various compat readv/writev helpers
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2iZqUhwWqfnyrCorjHu9HAFfTRyGHreiJbYW84XXcUBc+SVzGfV
 YwYWlYE5AyEm6TbVxUd5InPT8u2v3ZybcYT3PO5gKlsDfP08T453rna8uk9NuXYaUmYQNBW
 BuVTvtDwWlm33Wz/TiPT+UAoZHZdmz6gUwGx/9Ycmk4SfskmqItpXFMJvTtQhJS4k+5cnyq
 sgLEGJT5BVOeFLQRaGMbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IokcrWFMwaE=:SYIV9lIoAyPDURr6LLJUQC
 XniX18EAu0Z7YheaavTp/GpjX85eVEg1F6RvmgnNp5c0xOq4bbwIUSa+T4NNx4wuXsajOcED5
 T4s1iyuvhA/FPRL6Dc3q7GmMAieilTnbAs+3ZIB7E2R4r7qLXT4dqoRI5XYmVuy0zxaBaYVuo
 5QSroNJHFCLn+AZTxaG8iq48cQPIrpUTgkrDpZ+jluaddvZXazRboiMgzVWjmJ5OvIb6M3cZi
 mHllyX5qa8sCndpit7lol9S0d1108LCObL35jxPSMr1so4NO+0bUyrjVmyNKl2K4ma7Q4nwH1
 rbGO0zKrQ6aC1Uj23yQhrXJsaLXjXlySxSscR/o/Vj1FZIXazoSC2xakDz1DO2zbxfMDmlEoZ
 ye6TP0FAeOPE3VgDifCOC8TtLbwqgn2lbls9eUh7/SAzKsLfn63mTJcASVdYjdHS2bn+4OgMf
 N0sI2zM7sHNqNy8VcHNJ/HptgyKLX1HfRH/1Ud9QwLMScbbECLKMOHA8uvZ20IkI482VFqVmh
 gRo840H0Z1SKe8QI0CFubdOE5wpi3PD6tfzONXFv022UDZM/eI+CZuFF0tSUwWVFIFD2BBImj
 f6WCc/I+YSK7RRWmTnCXXQmQTWF+o60ZP8SR0hKSTFEWEv01RSnGizHlTdZqJvPyJCCEXbgd4
 XB5QznqTcu2L2TOPGIFUMZ2XkAe75Rpxvlu0NhyUApa05zJqwhruCYJyVv3XpobhHf8uYb0VY
 phmeysmoJA18nZoSsWuL9/XNJSrzK5mo2/J9RX/py3gP/RCb1AT1VNx7T4Nm+yzLZ0bOPOcXl
 3/fP4gwDuyHp88/zNbQPvVuJ+BFzpAJjL+61+oizj+1yTm7+BRvIHIwTyZGY5MR7hvgjOsQXA
 Kr200RGgQbnRCaHPoPm9/AGxsbmhYGiB7kNRVD/iwxlK/qLiWFsNNz1Bq3NynNW8+UUNroeXB
 wpF0rEeoN+tJk0jIAs00BKjSah/yRRyltBigLyV6Fqb9LcNfkWDi2
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 9:48 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> FWIW, after playing with that for a while...  Do we really want the
> compat_sys_...() declarations to live in linux/compat.h?  Most of
> the users of that file don't want those; why not move them to
> linux/syscalls.h?

Sure, let's do that. The trend overall is to integrate the compat stuff
more closely into where the native implementation lives, so this
would just follow that trend.

I think with Christoph's latest patches, about half of them are
going away as well.

> Reason: there's a lot more users of linux/compat.h than those of
> linux/syscalls.h - it's pulled by everything in the networking stack,
> for starters...

Right, the network headers pull in almost everything else through
multiple indirect inclusions, anything we can do to reduce that
helps.

     Arnd
