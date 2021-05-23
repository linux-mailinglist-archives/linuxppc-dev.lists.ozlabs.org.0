Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA638DAEC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 12:51:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fnxwm3x1mz3btl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 20:51:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=apJpFz3o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=apJpFz3o; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FnxwL1vSzz2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 20:51:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FnxwH754hz9sRN;
 Sun, 23 May 2021 20:51:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621767072;
 bh=X4NtLMivf9OnS/Dpei3UYlbkelZal2VO/5jUSAl6Krs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=apJpFz3oTrM1TCz5/jKU78KvIO5bPBBdqh9BIizd3LavEzQu4aBuFN1AY17K7yWtc
 5Ys5HZuq4tIcylMjvwrjriWbEpER2Sh1fG26L4/w5A2HKxUgfU/yqB/wcYgw53sYaC
 creV/kfLL0JbdpstR0krx5/Qy+gTTKWvPem7Mls/87DAvzu4ZuTKSsDWnpryu4Ak+t
 CDrkcPA3iMnqUegZ1kx9QPdQBWUIlTBxpoR7qUiOmFg83BOm3OYgXJ9oAAVXtnHCJQ
 pI/FbKnQTyJZenWSJW3wW0JNbYTZXIhx2OT8lSdGeMDrLGVg01PyKZx6K1p2OBbjQI
 9oX9MN8EN8Y0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg KH <gregkh@linuxfoundation.org>, Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/udbg_hvc: retry putc on -EAGAIN
In-Reply-To: <YKer6KPaHDgaWS8k@kroah.com>
References: <20210514214422.3019105-1-nathanl@linux.ibm.com>
 <YKer6KPaHDgaWS8k@kroah.com>
Date: Sun, 23 May 2021 20:51:09 +1000
Message-ID: <87mtsliuzm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: jirislaby@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg KH <gregkh@linuxfoundation.org> writes:
> On Fri, May 14, 2021 at 04:44:22PM -0500, Nathan Lynch wrote:
>> hvterm_raw_put_chars() calls hvc_put_chars(), which may return -EAGAIN
>> when the underlying hcall returns a "busy" status, but udbg_hvc_putc()
>> doesn't handle this. When using xmon on a PowerVM guest, this can
>> result in incomplete or garbled output when printing relatively large
>> amounts of data quickly, such as when dumping the kernel log buffer.
>> 
>> Call again on -EAGAIN.
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>>  drivers/tty/hvc/hvc_vio.c | 2 +-
>
> Subject line does not match up with this file name.
>
> Don't you want "tty" and "hvc" in there somewhere?

It's a powerpc only driver, but I guess the subject should still be
"tty: hvc: ..." to match convention.

I was planning to take this via the powerpc tree, but I can drop it if
you'd rather take it.

cheers
