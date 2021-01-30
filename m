Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99452309611
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:55:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSchJ53wNzDsc1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:55:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P+RLxVau; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSbKw6K9KzDrRH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:54:27 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id y205so8063720pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=iB/Mn5DKxfzvSgwZ1NnsZ2zA6keRMohRH8sOnCuYDuk=;
 b=P+RLxVauLoTyfiOtlYDiQcRlYvUX4pTMHp86t6MjpB/K2pNmZieB/3lTrhcjVr6xHt
 DfbqpSO7sqTqheazQmubqweNQqeDnWetqLqi8DJrYPCToY6jk6799sg0ofIWP5Knk7HR
 N+4zg3ewtSfVD2lIYBC3BcktwX9KZg4oW19CMk311IhKqTCa/OxUHiNHHPsATXd6R2MG
 u/zy5t6qwYblwF3rXt5FP0ppGL6RQgjaU0qO3A+SksMSGffCpPQwD96SS0aeopNui+GP
 IYtlogUUO1duP8BTw3JR3ppzzENu2Vr0suTLM3oeOPd4H/8wX5JKsePoZoZw8YHTqc3i
 w2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=iB/Mn5DKxfzvSgwZ1NnsZ2zA6keRMohRH8sOnCuYDuk=;
 b=rHwNmzeBG16cxdUHVaTZhk9dsanQCYTuZqqEjYkPkoJ3vKpaEA8l3wOCePeMovEt2D
 R1y9gExuiuQfV/wHJm0cyTiQYVx/b1mfcgAUC/h9C77LBtmehEW6W4L5hn3cOq53v9rW
 6tuVzzpAC6HTxkQXHoU3qQR0hf4ieCfAAGCOWDwgJUB5U/owYw6u5ohRllakLP7p7l2z
 u7fy43ajXWO5/6iL5f7WxSIr5sWoHr+WQTtQ9G5s1YqVe0f1K0rB9HQSuu4++ep3vWqf
 Sry53Wd3xrTx6PEvzBsHj6uEqnIZ0eA0/Fu9yKYDi6njmKlJW2UWwUgw58apRHm7RYav
 O2HQ==
X-Gm-Message-State: AOAM5331gPrTHnJp8/cdMISO5bE03f+Y6BRe4t8eymV8yYL2pVgNOc9q
 x2XS8mBeLwaw83HAy145K/XfMDN1EQ0=
X-Google-Smtp-Source: ABdhPJzQ03uLd63f1oiVWF2fVtE0Rh2MuLS+y4a501CyOCg135PXmLMN17WdH/FlOdAvxhy45w3Yvg==
X-Received: by 2002:a63:4e63:: with SMTP id o35mr8746098pgl.291.1612014863365; 
 Sat, 30 Jan 2021 05:54:23 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id g5sm12341095pfm.115.2021.01.30.05.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:54:22 -0800 (PST)
Date: Sat, 30 Jan 2021 23:54:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Zorro Lang <zlang@redhat.com>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
 <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
 <20210128135220.GQ14354@localhost.localdomain>
 <aedb880b-da2b-ec29-3b66-66f01733be9b@kernel.dk>
 <17ae2706-fe95-a5de-b9da-e3480800daf7@csgroup.eu>
 <20210129065220.GS14354@localhost.localdomain>
 <18dd441b-440a-fe95-0907-d8cec5b49410@csgroup.eu>
 <87r1m2d5z4.fsf@mpe.ellerman.id.au>
In-Reply-To: <87r1m2d5z4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612014260.b4fac0liie.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of January 30, 2021 9:22 pm:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> +Aneesh
>>
>> Le 29/01/2021 =C3=A0 07:52, Zorro Lang a =C3=A9crit=C2=A0:
> ..
>>> [   96.200296] ------------[ cut here ]------------
>>> [   96.200304] Bug: Read fault blocked by KUAP!
>>> [   96.200309] WARNING: CPU: 3 PID: 1876 at arch/powerpc/mm/fault.c:229=
 bad_kernel_fault+0x180/0x310
>>
>>> [   96.200734] NIP [c000000000849424] fault_in_pages_readable+0x104/0x3=
50
>>> [   96.200741] LR [c00000000084952c] fault_in_pages_readable+0x20c/0x35=
0
>>> [   96.200747] --- interrupt: 300
>>
>>
>> Problem happens in a section where userspace access is supposed to be gr=
anted, so the patch you=20
>> proposed is definitely not the right fix.
>>
>> c000000000849408:	2c 01 00 4c 	isync
>> c00000000084940c:	a6 03 3d 7d 	mtspr   29,r9  <=3D=3D granting userspace=
 access permission
>> c000000000849410:	2c 01 00 4c 	isync
>> c000000000849414:	00 00 36 e9 	ld      r9,0(r22)
>> c000000000849418:	20 00 29 81 	lwz     r9,32(r9)
>> c00000000084941c:	00 02 29 71 	andi.   r9,r9,512
>> c000000000849420:	78 d3 5e 7f 	mr      r30,r26
>> =3D=3D> c000000000849424:	00 00 bf 8b 	lbz     r29,0(r31)  <=3D=3D acces=
sing userspace
>> c000000000849428:	10 00 82 41 	beq     c000000000849438 <fault_in_pages_=
readable+0x118>
>> c00000000084942c:	2c 01 00 4c 	isync
>> c000000000849430:	a6 03 bd 7e 	mtspr   29,r21  <=3D=3D clearing userspac=
e access permission
>> c000000000849434:	2c 01 00 4c 	isync
>>
>> My first guess is that the problem is linked to the following function, =
see the comment
>>
>> /*
>>   * For kernel thread that doesn't have thread.regs return
>>   * default AMR/IAMR values.
>>   */
>> static inline u64 current_thread_amr(void)
>> {
>> 	if (current->thread.regs)
>> 		return current->thread.regs->amr;
>> 	return AMR_KUAP_BLOCKED;
>> }
>>
>> Above function was introduced by commit 48a8ab4eeb82 ("powerpc/book3s64/=
pkeys: Don't update SPRN_AMR=20
>> when in kernel mode")
>=20
> Yeah that's a bit of a curly one.
>=20
> At some point io_uring did kthread_use_mm(), which is supposed to mean
> the kthread can operate on behalf of the original process that submitted
> the IO.
>=20
> But because KUAP is implemented using memory protection keys, it depends
> on the value of the AMR register, which is not part of the mm, it's in
> thread.regs->amr.
>=20
> And what's worse by the time we're in kthread_use_mm() we no longer have
> access to the thread.regs->amr of the original process that submitted
> the IO.
>=20
> We also can't simply move the AMR into the mm, precisely because it's
> per thread, not per mm.
>=20
> So TBH I don't know how we're going to fix this.
>=20
> I guess we could return AMR=3Dunblocked for kernel threads, but that's
> arguably a bug because it allows a process to circumvent memory keys by
> asking the kernel to do the access.

We shouldn't need to inherit AMR should we? We only need it to be locked=20
for kernel threads until it's explicitly unlocked -- nothing mm specific=20
there. I think current_thread_amr could return 0 for kernel threads? Or
I would even avoid using that function for allow_user_access and open
code the kthread case and remove it from current_thread_amr().

Thanks,
Nick
