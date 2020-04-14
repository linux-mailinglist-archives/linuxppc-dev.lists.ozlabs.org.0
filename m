Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE051A800E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 16:43:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491pC25KHZzDqZF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 00:43:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491mFL3847zDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 23:15:31 +1000 (AEST)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MUXlG-1jomD91BPk-00QUEr for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr
 2020 15:15:27 +0200
Received: by mail-qk1-f170.google.com with SMTP id j4so13016728qkc.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 06:15:26 -0700 (PDT)
X-Gm-Message-State: AGi0PuY/poXBEywe2nEjauQGQYgcjyQ3FyiMRaxhQPgclRYEwGFrUvjE
 sxwwuSn1gZfu4j8gbWzypi6YiRrGqQdVBaNOVDk=
X-Google-Smtp-Source: APiQypKOQ+PuEkXGp7Hz6/dS0o0rdKdh/QEInnUOkTVAVIiLqxS184q6+DgOArKrPli8Cwrbt3SJu+aKb3Opir5v4iw=
X-Received: by 2002:a37:9d08:: with SMTP id g8mr13992637qke.138.1586870125394; 
 Tue, 14 Apr 2020 06:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-5-hch@lst.de>
In-Reply-To: <20200414070142.288696-5-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 15:15:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3HvbPKTkwfWr6PbZ96koO_NrJP1qgk8H1mgk=qUScGkQ@mail.gmail.com>
Message-ID: <CAK8P3a3HvbPKTkwfWr6PbZ96koO_NrJP1qgk8H1mgk=qUScGkQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] binfmt_elf: open code copy_siginfo_to_user to
 kernelspace buffer
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6J3AYC5un6DK7hPQGY4I8gjgiK6qkm7MYRXf6tRNGjv+nKHlwvb
 iKWbIM1hR7qYn/5Oec7IHWPUfOKpMTbygBlLUlAM8E88lxopA+zq+uOQnEYWS0Axts+t7D+
 pynhtE3hxJ8xI1171CAe+libeLj8ndPedaAZ8FW1ioi6lchwJVA94U/ISwZ6ibzsNmcoPCx
 lUEGaD/h5/UKnuyJClDOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9sdtSQAvPEk=:qjNBAe+eKd6KU/9eMkOd/4
 aIkjTApSSO1jCPgKuGDYSXKh2nBVL3qEr7I6bzzNZb8x8qLNhdpxmdA2Z9zgUu8R+OJBxUEl4
 Uy7r8vGfjraAkR1hhWy95VnwpmiPQJPeSvOmnutQzCQcYbDjCuuaXy23ENr/oIoyzB1I/0whI
 JZIa/1WvhS6Jz+ttQlHSpFQXBH6l1aBWk53D+ny4WlQPKJX+dXhasPMjYLYKL/552zBrWw0un
 2HmrhxY2CJwdHK1g0wbB99KymXHZ2uYZKVFPWo+PdHx5tTTqE3EXxsy8JyF9/Pe5t9g9Ez+qM
 BaOB2mI5x+eVutwD5s6btZPJHdeAGtPvXuUFZfaWu2E+80v6FYbMuaHA+iz8uzRJIyznfo0wH
 cnFqtIbw8cWlgFeBcdkduBdCVXkPUhJC8qqrKSuhHet2OHe674uFnrTc8Enl0zY4SiErXAJ9y
 fikw+LYaYqhh+QpJiLhRbPhmSU0uYXvoOmbNOAlb/aHeAmJKSBkUhtOty94KBRt20MWDaZARZ
 gxHPHOE5/5oaCCSA4fYDFQBbkfD+zj6FKlCbP59Vn1Iu8025gqIJ/qcRNGuSe2y63oB0i62lV
 N/K7FulyfbiX/3SexNlX1f6as2BT/M82eGgFbMC/tQwDpevBxuW8jcXG4JXzew20b/WlJV+RF
 sc/xtl6gh49IQ+rL5nIeXhZ0hilrLDwi7+Q2aRAbpGd6YWl/qBQ3QUlmPYtONhZKri1V6oanW
 ruqrEd2Nwa23O5bRU3SCHjcOcfpHc8G2wgx8y13fY7jEk+7EBHcvN8DsDvfCRuJ3m9t0GQeV2
 8Xr2LZExBCyyatGt5Fhn9DE5bzQaLHByp6PS9ak9niBLiMD3GA=
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
Cc: Jeremy Kerr <jk@ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 9:02 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Instead of messing with the address limit just open code the trivial
> memcpy + memset logic for the native version, and a call to
> to_compat_siginfo for the compat version.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice!

>   */
>  #define user_long_t            compat_long_t
>  #define user_siginfo_t         compat_siginfo_t
> -#define copy_siginfo_to_user   copy_siginfo_to_user32
> +#define fill_siginfo_note(note, csigdata, siginfo)             \
> +do {                                                                   \
> +       to_compat_siginfo(csigdata, siginfo, compat_siginfo_flags());   \
> +       fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata); \
> +} while (0)

I don't think you are changing the behavior here, but I still wonder if it
is in fact correct for x32: is in_x32_syscall() true here when dumping an
x32 compat elf process, or should this rather be set according to which
binfmt_elf copy is being used?

     Arnd
