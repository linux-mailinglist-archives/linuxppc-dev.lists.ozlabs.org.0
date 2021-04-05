Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4D35420D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 14:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDVTm3BH0z3c8V
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 22:34:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lcLAn8kU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=avagin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lcLAn8kU; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDJXG0zN4z2yYp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 15:06:05 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id l1so5112113plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3fTbn810HKtN/GZd+dZCj8RCoC/4KxCPs7oA5W4KPVE=;
 b=lcLAn8kULzxXgKxShV0AgqXyZVuvRyCyKMeeLGzBGvjWr7mIRSTJD1+r1qPGJ1EgsG
 mr9VH5qCnGODUNz7i75WS8IjkIsjtYBylmrnRkAr/+/+IPYzfHZlYnRffKaNsJjMZpkm
 Wfv7W78b7hKqXb5Z0gc/P85tMkBiY3uBAj/Y+p0O9vlrueO2Xfig3pXgoSLrkik5i+Is
 1TTfFljgGBD5tDba2M3B+USQAJVZrbNEUdNo7yDijYDoGPAThekRmqNijVBgB04UQ0g+
 aC1/jEmd8tGSQFaFf65hgwPJMiLzNOlgn3+xy1mtpm3NDzEFh6PzUiGoh1Rq+ZnNiDgw
 7qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3fTbn810HKtN/GZd+dZCj8RCoC/4KxCPs7oA5W4KPVE=;
 b=ID9Y7Q1ONGtwZ3+JYmVqXG0x6CUQqMQTxFPdYlvhqxPJ8CHo6eDptntnH+tkaQ9hpd
 Nds+KKCEKTVO4vfRKZXNy4F0RlSILw/k1O9Cp8YLy3d/LrJvqFAvARlcsNqSHKkcmkIJ
 BLPljAt3S5kpmMxAPr615Tp3HretCH/sO0o5nRCYPyUJKAoHfUVggkeDMtm+PcI+2rsz
 HqM2vC7RsNMsowRct2gwbtYqMrUAvet64zi9Sjt5BaQhXUy0jsDTlh2aWGlTsnlqSZgB
 7uDZu6cOmF16vs8n+8s93DPZ30FbsKFhNUngui4eBrYHX7vvuw0/sDs/gUq96QBkhU20
 b4KQ==
X-Gm-Message-State: AOAM5330r96CvwhLFKgkDImLgnsyAh4S8S/LQ0WUj3qRg2wv6bXrwuNA
 3+7hUdMKipxybC8Vbb/Rr34=
X-Google-Smtp-Source: ABdhPJyF3TpYVCScDyhQYs9t8pf0zVDvyUve9gBh0d9Z+/i+q0bTH/Pl0G9hBaDGosAAAkd3neTyWw==
X-Received: by 2002:a17:90a:9385:: with SMTP id
 q5mr24897665pjo.121.1617599163672; 
 Sun, 04 Apr 2021 22:06:03 -0700 (PDT)
Received: from gmail.com ([2601:600:8500:5f14:d627:c51e:516e:a105])
 by smtp.gmail.com with ESMTPSA id q66sm14846339pja.27.2021.04.04.22.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 22:06:02 -0700 (PDT)
Date: Sun, 4 Apr 2021 22:03:37 -0700
From: Andrei Vagin <avagin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RESEND v1 3/4] powerpc/vdso: Separate vvar vma from vdso
Message-ID: <YGqaKYnLnvj2brJ8@gmail.com>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
 <f401eb1ebc0bfc4d8f0e10dc8e525fd409eb68e2.1617209142.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <f401eb1ebc0bfc4d8f0e10dc8e525fd409eb68e2.1617209142.git.christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Mon, 05 Apr 2021 22:33:24 +1000
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 04:48:46PM +0000, Christophe Leroy wrote:
> From: Dmitry Safonov <dima@arista.com>
> 
> Since commit 511157ab641e ("powerpc/vdso: Move vdso datapage up front")
> VVAR page is in front of the VDSO area. In result it breaks CRIU
> (Checkpoint Restore In Userspace) [1], where CRIU expects that "[vdso]"
> from /proc/../maps points at ELF/vdso image, rather than at VVAR data page.
> Laurent made a patch to keep CRIU working (by reading aux vector).
> But I think it still makes sence to separate two mappings into different
> VMAs. It will also make ppc64 less "special" for userspace and as
> a side-bonus will make VVAR page un-writable by debugger (which previously
> would COW page and can be unexpected).
> 
> I opportunistically Cc stable on it: I understand that usually such
> stuff isn't a stable material, but that will allow us in CRIU have
> one workaround less that is needed just for one release (v5.11) on
> one platform (ppc64), which we otherwise have to maintain.
> I wouldn't go as far as to say that the commit 511157ab641e is ABI
> regression as no other userspace got broken, but I'd really appreciate
> if it gets backported to v5.11 after v5.12 is released, so as not
> to complicate already non-simple CRIU-vdso code. Thanks!
> 
> Cc: Andrei Vagin <avagin@gmail.com>

Acked-by: Andrei Vagin <avagin@gmail.com>

> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: stable@vger.kernel.org # v5.11
> [1]: https://github.com/checkpoint-restore/criu/issues/1417
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
