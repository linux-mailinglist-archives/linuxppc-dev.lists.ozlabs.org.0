Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A31BC49E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 18:10:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BRT85D4YzDq9p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 02:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BRFd3yHLzDqld
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 02:00:49 +1000 (AEST)
Received: from mail-lj1-f171.google.com ([209.85.208.171]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5xDJ-1jWTTD3tox-007Spm for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr
 2020 18:00:45 +0200
Received: by mail-lj1-f171.google.com with SMTP id f11so17458118ljp.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 09:00:43 -0700 (PDT)
X-Gm-Message-State: AGi0PuYwrn4/Sa2mOcpcghI5yt/mkhLuenOvkjTKNFY/UBuPF/9svBMH
 LtVovPC7+qwTZGZYRWuo6+qYiH/boN0cAkJ6Uxs=
X-Google-Smtp-Source: APiQypJThOW83qdHGHzyhkH4sJ6U4sXcXcn5825s0jldl8o9a+uRjS1sadwzmhdc0oXB7iboieBolhXuuMdbgRNNgT8=
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr18875369ljc.8.1588089643465;
 Tue, 28 Apr 2020 09:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200427200626.1622060-2-hch@lst.de>
 <20200428120207.15728-1-jk@ozlabs.org>
In-Reply-To: <20200428120207.15728-1-jk@ozlabs.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Apr 2020 18:00:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ytp2eLa8sfC0se5fR-DFxMjqEh8_Y2N4PeH-yo1nhxw@mail.gmail.com>
Message-ID: <CAK8P3a3ytp2eLa8sfC0se5fR-DFxMjqEh8_Y2N4PeH-yo1nhxw@mail.gmail.com>
Subject: Re: [RFC PATCH] powerpc/spufs: fix copy_to_user while atomic
To: Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:H+32YA2yp2aflN/hglYbSIn43YMSR7sgJRXlCTqQo3Ik6QKZCPk
 8/uHD+Kh6D161pOrkolwMH+VgSgAJ1B6d1YaATuCminL23jYkiHAzTRrXuHIJ4PKJ7P+wuX
 DlPmIkY2jhHC+Eh5kiYVQFOjv9QCm3ERaD4Q9vAJKlIGkuvR0jjuXf6PlhScvLRJuS7cqEr
 39/hxjdhHaKDcACZBkipg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ed3FebliQDY=:HJEnDsjoDvDd1M33/Vpk+U
 UCdllOXkHJuGW1aGj2zcY/KJjJ4VibxBt1Z4/1fcJAM9o62Gp1j7D93DaRkOoxDq2lJi/5cLt
 Ljs1KPByCwwCjLRI1Es0JxlyW4iEsL4Wa5u4r2dmfVSE+RpLiFy+k2bFcPHlLLir4UOyDBtR4
 1jnR5Eh/Fz93bwqSltTj2m9BmDNo+0lpjEImIOO2l0OSNPEfhDgfJS1UEdbzalKhCVl94Zrlr
 m3+WV2cO2lDRjGws+Aj2HCsNkVir7TzBKrqV7S0SBK2zAdWjalKFJGz2ivFCjw0vc6gsjTrhP
 LSYoqVVJVX/ARi95AtnskqjkQjTobQUATv7ZA3JnXxTHGJZI+Ttnjgsax4G0Ih0dSRWTcrE74
 KuhlKp1F91wYR8uX35d48OIycvMrgd2C7W8XY9FAnyuureYL9tn+r/X7f0KopxduR7DIwkxu3
 cp59TbF6vDZ9WVNm/mqLtkfcfjhxwSnjSzNDRnrMxFcp/hcitMbx4bFqL1Y5Px7647rUU4qFy
 8JUQnZVLmU+XHr7AC5UhdKSdCdMxUczVE011ahQ3UAtQwR1ppVxN8ZPm1t7s45z4MaJx33H+j
 O4hEBnOVuBeyiqn0l5ZnMnIcSXmH8h6m05ulWWq5YHBSQ6vFOxVSl6eVLiEHXEagIT5iPjtI/
 0DmjTbvwx6MfVT3Qackrl0O/Q3iqYIiufJmqzE75bxR1gWVseHFdCTqs63w2hnD7/kYWktq09
 1k2BG8px+Qj4/9EyBqYjVAESixoBp77qQnFM1m8GB4VB2PCCHaVptJghSsJNQfQpaVgTSfzIQ
 NXP63dfHecSPm7E58OH/jUOhHe2vx9zla+ZIsgSORcdJc1+Vus=
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 2:05 PM Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Currently, we may perform a copy_to_user (through
> simple_read_from_buffer()) while holding a context's register_lock,
> while accessing the context save area.
>
> This change uses a temporary buffers for the context save area data,
> which we then pass to simple_read_from_buffer.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---

Thanks for fixing this!

I wonder how far it should be backported, given that this has been broken for
14 years now.

Fixes: bf1ab978be23 ("[POWERPC] coredump: Add SPU elf notes to coredump.")
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
