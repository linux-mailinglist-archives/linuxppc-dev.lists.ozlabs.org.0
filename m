Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892F37C769
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgKhw3F7yz304L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 02:18:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ILRKGl/E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=schaufler-ca.com (client-ip=66.163.184.49;
 helo=sonic317-38.consmr.mail.ne1.yahoo.com;
 envelope-from=casey@schaufler-ca.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=ILRKGl/E; dkim-atps=neutral
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
 (sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgKhQ6krQz2yXF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 02:17:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1620836274; bh=sTgvXuL0QyV3DWP7rJnz73UM1noGLdd9LQiIFFkdesM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=ILRKGl/EIHUvQjhp8Z/kl2sjgVpMP1RDKh3CuccfjslVJQYHnqHtTNkeTHiVJkR9cQnbDdC3HL9+DLoQfJhcjCB6ocDEXTAh9l0rBArFe08jlwrZeWYEUMcEmNjI+dm2xQ4gbM0m/s2NCRJpIoWD/9pHs+CwJfc5A/ZIGE4DaAcDy/MpZtk7Eby1BT9GjOqNvpN2f/1tJ32fPyC6h2rw2Mkj8PQgGIeqJxKvP845zI4BIJVW9Vt/iHHzamwT/VM7JfVfD9BpzP2hR6s8tFf8fX7rD61FH/J0t2rwecGyZy8ZCb6ud3t0pizN0wQ4Z9KQ5m/e4gMmZ2hf+vSKFUtIFA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1620836274; bh=9zkzFpJhpAtKSS7dp81m3gO08jVTWzIIU41o5cVd1QD=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=riO/9yTMWiAOR3F2VfwmHuf8wv+kL1VYCecGPju58EecHRAs9CywkyiQGXWCP4opx4XrozrDbWCNKCN8c3AvVkJed71MregD+4Plpy4564hcezqKYdS/8Dz/QRFu712Mxn+N5apkd3VW4RqY06028meNsJ930KSRAZ7QWhktNwqL/e1IpM1d8lXZn+14Ht+Fz1bgHZVn2V1+7CMWpF4O+OPmY6Nb9zSIaap3K1FL0vxRmOnZCqwZPOaLgYfzlPam4W1Ty0esh1IJxfzSYz3mEaLc8BoNwanI/3gX4hpzkaCkG+pHd62RtWaNuTa8pkrv5cPjDsRTpz1dydbyBdMirg==
X-YMail-OSG: u3eIsq0VM1mrdWqd1ddc3yi2FSJAQ4ntlInGeECmzJrk_SDLHdW6J_k8ZCquxd7
 OiYa2lX6SplN0e2K9uf4CqoloD2.5_D5zwfJAcWjJAmAFq_I84XSvl.77YdT9abn2hvpYoa8.ch9
 jaiJg5aqvOFCiWKdn_.BsERkiiqL16HqSVhYX.1CXskeVX5.0Zgo.74vkVLxKHvcELAg2nOHDQDy
 BdeexdMuHABDfG0wVOBFgTuS.VpFcMcYh70AHl2bN6vy8QfUaamWMGHjwuXY1kspO8lr_exoj0vG
 Mp.HZRJ7gMra3c6stz.XSR6K32tQNckEFyVZDdGkBBnoSXINRnk1UhJNyqXAPnvF05f6oj1orQHA
 NO59mWNhg1De8R3lsGqO_yQEb8GDJcrfdxnBm7QN4T_QfZ4gSUMj9sIFop84ygypmGVWLIFwiUqb
 Orqi4pESN2KWdBAy6cTa7m._I7UPOtOVACdlM26nX3A.WsAUtWM6KSSRfI6DpKAumnDJEGBXVWAq
 hpb4Do.gq3pBvz9Wr3D1prsZ2RSkvD2LzYCUx1PhaqDCPAQyDv8Ju15ffbuXcD9SMZtQbFZWw5Xo
 gdHq.AtO.4IFfsKqvnG7K0Rgw.WJCNCOvg0g3bJo2Cx.h20PPgl9oEpoTxEuzG1IEumou.SYbRNR
 Lmc3nWhEQ8SdYV049qNpogc8rW1skTTaxlMf8xQfk9_EOdFXXRKxW06F5epGkZlkk4ZTgaf3sBtp
 9jV.FiKz0yilKFKqtuHS.vkwKK4IGBkLUoTZeGiAVocYLhIgi6.JjYPhWMCY8XUFWkDgTzJTb13W
 cAHOWSZHlPc_mxADVWFRpL8_6lG.0mzqEw0RdqUahWpVuQqU_cK9n.ymtf8u2hF1wmMlU3QzYM0c
 CQkZvblKkuY2XihwwZH87P8.XFIkgRpgLZEGj_eUJlEAM30Y02f7UeB1gTbt.oR5psmaz35ApPmH
 DfDejf6dgeIkrB1B_V.ThE2el.agVt4TP7VXg.xGRDygYAQFn1hSeH6PuwiVQECYrKQlBNgqnLY5
 xYpZGddZzG3nL7xK._Gmm4w3FYRCPSxDsH8.qlfM7pvRGoyK2XYU_KfeMJ_M_qMe7jzU.nLxijLd
 O3xhcZTrKcgbUCv9Kkw23O6xOCBbMshXeyoLrVEyrTlT_rRoo.0PUGGtFq0ZTY6UOufDSVlle0az
 kZ4ZO97WgSyuUjhuCYy.vzHjkEv7aWk1hHpa_Kb.xuZ7e6BgisQFmOhtMBoVX.t4hKPvSGJv2qSI
 8g7n7nNgKBRbt.woahmI2bwwHmUSCi1IZg60fv0Z8BJ5vqz1Eb2EY4kYvn8mpgz4phcRVsQz582G
 CGr_9Ik6oO2WqQxJ9MwPquC5OlFDDz3x6331kD1MmTlu0mhVeamp1vvUmRiVxukUKGoOCkCJmMxv
 9b1B09fYbT7fC1.JGF9GFxr1_pR06EhI7gumLwQVJuw4YZae3Ag0cm2Y5U6Hv6Y.Hw6L9wvhLY7V
 sIl_qV2lMaJTWCw2a4vzGEDWezx2Y7bsFBRnEK0FtT9Yg9sArVPVbGlv5xp_QTu63ULo5qqaOPCI
 JoCw3GNvYwCDX0_8aFj0bHZVcQ.sKzv98ZRCw6Q5tqdNoTURUG5BPtl7kVQMA.spaaxoxwxkPot5
 cRGZDyBulQSULXf3L8Tw113evFWAxZs_Ms1AynP81S_dJTNG64ZRzuNf2IDvURhnmi9nTsVGPDM8
 flIpwTscFYGSWqWr6G6GVzisfkEte1GiVj_70RydDPB38ay0hieyTwfOUzeIl5RI0nuq7Z4zR6s4
 SMtXXnKI9oXWi7JgdKR5_w9feK3WUAQTMvPwjYohdgFgG.l4RfrbSbdVtPXKI7XIsdeamQIoqBcV
 WlY5vmwcD0fxEGZ5H7tFR171rmBaZgBUBRL3Ug9YkP88TJ.YWPtQsfJIQ9BUYzKKKIZ5hWNiIycF
 mlHe8CqUpycYWLCQzZf.08VQ0YdcicsvC87Ti6NBC127Eq2hVj9jQBClunBpfVxZU5MFkM5UOTbn
 vXX9C.L92BHWxZD9XV0uRwjQo7DRuGjRIryoWtvJaO7xEavh82BDA_INEbu.aE4rhovJT_K_XBtH
 heEZIA68O4PM1aFV6MicyFjsWR.8TadXZm03IbQ6HGf8ti5EyCNMlATI1hPy7QI9yG56uwHg4_9J
 ygk3dF2gyRwnedbZ_TWL5yx5hHW1yj0hwP3vRRAEDzcZVjdj4x5MgQQ6UknN25w3WejJaz4Du73H
 WjM29DUunllmfHDR0uJDZB2dMLnJnZ7VcOa4_JAwcRbjcEhslkDYRSgVc1jEfSssT4z6u8PVHJNG
 fhxXKzWjrLTV4Nv_wnExV8l3wyT9wF5x_i6.5QGUrzGbu2Rug7KaP.iX9USns6LwPaY8l3x7dPR5
 iRc_Py7GOzpdSNtTMEtm5PnTWu_Pvh8PGuZSovSqxaSp3O18yTT70Q4LM_Te8yFCr279_pQ643kG
 17LeZHGngeoCcTYaI_53Z8Z3xZ9bkKZanq8FYJN9TwmHZdjIZCrZfYawR_ClUkijR8NUsZMa1E55
 wSndKvXCxwTRcHzD1I4yKH1gOzA24NLTtKQ.vbJMQl9vzdovn.4nlIPVDhk1N_MfcgLv9W0MBwcc
 i47JMxCHExhPtMndnfQzIe47vbd_n7N9CjODTLhpeoyxeUXZjrdMpVB9mz4MFBrZqzdyp.zK7BFV
 iN_zLvOD4L5oDvnYnebFDsnA.fdhh5K9yfRKmDa7KrS50TqXY4VB661xASPjXj5fDOZdjH_7flhM
 n6tXczhGkJ6_FP2ucySIDAfxqvLxBC.2B0mbOed8ZTGYlS2FfdiEy4PHAvXw0wFSl._.0A.ybGzK
 9zFunST1.TFXwoPhARYYSN.Fd6KXs.U.uUuXloJbsx3M8QjAsgPgV3plULiJq_a34jAQKHzMr2G5
 FwNNCStb4KkYO4iWxfGT7alhLjbZPZFZHypY5XXBZWodGFOYViXjxtQQQu4WErUIAbkHuDF.5yhX
 kEBkbUk2KzXv9i6fleXOb9dEN.B4NbJOUB3fwQqg.tT8I1Sy_BuVpM53_UPxSWaUaME20WT8ycYi
 WBrUb80dAKq6gYEId_towkkqZoOmFtdReA9SuK8A.XKPMlnn7U0DZHoDkSDQdWEupmUenOZFSvlO
 CYW0D.pl8nsE2xeDYvtbywONuTFTbaXIO6xlfDiRyWdoiSEVJccNe7D1JnwB7qw1fpLtBx30kVma
 XLaBND1Ym.0.zhtr4bSeVD6njYOwh0sNyzZKSCtkVqC.OKRaG73BjWZJTIcfzhMxD6162r77CnUd
 WgDWHBUbUJ4sgDqhGyeZZy5mXtN64kDlIA7R6Nhy1r4waHr.twbsBRL1UpOgVBQhL5P5t_cgWPTq
 OOYmB5JUP8eL0gGdXauAb1ToPk02T8WFObZHBaHeuPozUwCPOdNqvwgaQLv1eN6ThTOTOCFK3k6V
 wZqbsvUYwokjwCxMq.WcQDMtGlC.j_n55PxgXmXfunkwsS_vq6dV0RjBfIoZAcyekEe4oGR2Nepu
 9JBe_dM13xK1MCoU-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Wed, 12 May 2021 16:17:54 +0000
Received: by kubenode575.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID aeedecbba43991c93baefb338f58092f; 
 Wed, 12 May 2021 16:17:51 +0000 (UTC)
Subject: Re: [PATCH] lockdown,selinux: fix bogus SELinux lockdown permission
 checks
To: Ondrej Mosnacek <omosnace@redhat.com>
References: <20210507114048.138933-1-omosnace@redhat.com>
 <a8d138a6-1d34-1457-9266-4abeddb6fdba@schaufler-ca.com>
 <CAFqZXNtr1YjzRg7fTm+j=0oZF+7C5xEu5J0mCZynP-dgEzvyUg@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <24a61ff1-e415-adf8-17e8-d212364d4b97@schaufler-ca.com>
Date: Wed, 12 May 2021 09:17:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFqZXNtr1YjzRg7fTm+j=0oZF+7C5xEu5J0mCZynP-dgEzvyUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.18295
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/16)
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
Cc: SElinux list <selinux@vger.kernel.org>,
 network dev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/12/2021 6:21 AM, Ondrej Mosnacek wrote:
> On Sat, May 8, 2021 at 12:17 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 5/7/2021 4:40 AM, Ondrej Mosnacek wrote:
>>> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
>>> lockdown") added an implementation of the locked_down LSM hook to
>>> SELinux, with the aim to restrict which domains are allowed to perform
>>> operations that would breach lockdown.
>>>
>>> However, in several places the security_locked_down() hook is called in
>>> situations where the current task isn't doing any action that would
>>> directly breach lockdown, leading to SELinux checks that are basically
>>> bogus.
>>>
>>> Since in most of these situations converting the callers such that
>>> security_locked_down() is called in a context where the current task
>>> would be meaningful for SELinux is impossible or very non-trivial (and
>>> could lead to TOCTOU issues for the classic Lockdown LSM
>>> implementation), fix this by adding a separate hook
>>> security_locked_down_globally()
>> This is a poor solution to the stated problem. Rather than adding
>> a new hook you should add the task as a parameter to the existing hook
>> and let the security modules do as they will based on its value.
>> If the caller does not have an appropriate task it should pass NULL.
>> The lockdown LSM can ignore the task value and SELinux can make its
>> own decision based on the task value passed.
> The problem with that approach is that all callers would then need to
> be updated and I intended to keep the patch small as I'd like it to go
> to stable kernels as well.
>
> But it does seem to be a better long-term solution - would it work for
> you (and whichever maintainer would be taking the patch(es)) if I just
> added another patch that refactors it to use the task parameter?

I can't figure out what you're suggesting. Are you saying that you
want to add a new hook *and* add the task parameter?

>
> --
> Ondrej Mosnacek
> Software Engineer, Linux Security - SELinux kernel
> Red Hat, Inc.
>
