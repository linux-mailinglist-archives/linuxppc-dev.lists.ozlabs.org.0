Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44594AD071
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 05:55:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt9gC179Jz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 15:55:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P3azDx6E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e29;
 helo=mail-vs1-xe29.google.com; envelope-from=michael.heltne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P3azDx6E; dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt9fX22T8z2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 15:54:42 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id g10so2112895vss.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Feb 2022 20:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=fD1hXo7qbnaSareXBr4uvCy8YTTwxcAvgF9/GXRp2Rg=;
 b=P3azDx6EqoNGBwRScKbwSdobHCcjQPDa0qWkZ22zM6ylu4/sAsp/wWiRKYBijRFT+1
 C7iJ7ZE4vuaZNIeSRp21/HyjX3hKJvGVmqUsHhNOhDiKqCpYwSjoCTjb0Qj+A6tvcSuR
 e1zqurlzGuHJkYgScvRpXAxrL02/I4IjFtK21hsBEWJ8drPXEWljEphCoeja8FDWZ55C
 aeutSlQGLWZ0Yd13ONrgrfB+2htuA0ZDFPxmTJDwB3vo4S7cZFzGSg32bKVO9gLrCzV2
 /C49VWRzGoCs7ho03bERwcghIoc7j9aVZD2kcNQscsr2ApT2nUEFgH13VBiVVb7A6vJL
 MOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fD1hXo7qbnaSareXBr4uvCy8YTTwxcAvgF9/GXRp2Rg=;
 b=O7SWIBaPFBd0POtcJCW0Jaep9YJrPEAdb2YwoTmuDkBL/zUuFqPUxQBZ5F29AgeoAY
 iuhAZFXp+kOF1tkU78ZOeEc1RSaeVojt0aloLBv7iUd6qlC+jwYZI5uYIkS0qP9Z9lYW
 6yHzpgZ8TG6scIQCFbplCTsx7ftLGS1kubh47+c6zr1Vs6w9cS4pdBM5o0BCSwJsSbCO
 OJOcpsJTVHYl6lp3g1muLPqx6D1HR812LYp0T0TzV5Kotu4L882OH5N2vSSLPn0KC3IA
 wL4t78Abkue53EVWhuBPnywG9BSRT9hoW6LlqMWwn05ad5IzyyuJc8xot+wGo/iVmqt5
 MunQ==
X-Gm-Message-State: AOAM531AhIcKUtxcI8Ld7DXH5W/L3m/mn2gPcSp/IOqx1ugCMuO2+dfc
 2aK9XawrV0FULcTZGgCBxZBIXTiCqLEv/Ju8bdxfORinnn4vDw==
X-Google-Smtp-Source: ABdhPJwt6vJ4yp+wtZ2AJS6YvuCDgqBLi13K+6b8Fr1rplk27PDNcVoxGMgCjLA9yOPURl2oQR1AGANbck/BFi5IAgA=
X-Received: by 2002:a05:6102:2416:: with SMTP id
 j22mr1123383vsi.8.1644296078743; 
 Mon, 07 Feb 2022 20:54:38 -0800 (PST)
MIME-Version: 1.0
From: Mike <michael.heltne@gmail.com>
Date: Tue, 8 Feb 2022 07:57:14 +0100
Message-ID: <CANtoAtMZwWqdL+xaw9u-7SNgjCHb_MbWKy8AFrG8_OhqNxf7QQ@mail.gmail.com>
Subject: [PATCH] powerpc: fix building after binutils changes. - but the
 'lwsync' question
To: "open list:LINUX FOR POWERPC..." <linuxppc-dev@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary="000000000000ae794c05d77a83c5"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000ae794c05d77a83c5
Content-Type: text/plain; charset="UTF-8"

We are seeing errors like ' Error: unrecognized opcode: `ptesync''
'dssall' and 'stbcix' as a result of binutils changes Unless 'stbcix'
and friends aren't as exclusively PPC6 as I've gathered from
binutils/opcode/ppc-opc.c there shouldn't be much of a problem, but i
suspect a lot more needs to be done? The following builds for PPC32
but also considered a cry from a powerpc64 user:
https://github.com/threader/linux/commit/226efa05733457bb5c483f30aab6d5c6a304422c

I've been running my PowerBook G4 with this 'lwsync' patch for a few
weeks now, but due to, uhm, soft bones, i haven't ran any benchmarks
or have been to distracted to do so, but thought maybe timing an 'apt'
operation in single user mode might reveal something, if it's being
used properly at all....?

Now I remembered reading something from 2013 on 'lwsync',
https://gcc.gnu.org/legacy-ml/gcc-patches/2006-11/msg01238.html
https://gcc.gnu.org/legacy-ml/gcc-patches/2012-07/msg01062.html

so that would end up something like
--- a/media/thread/12fd50d6-d14c-42af-ad1d-a595e5f080cd/dev/linux-main/linux/arch/powerpc/lib/sstep.c
+++ b/home/thread/dev/linus/linux/arch/powerpc/lib/sstep.c
@@ -3265,7 +3265,11 @@ void emulate_update_regs(struct pt_regs *regs,
struct instruction_op *op)
                        eieio();
                        break;
                case BARRIER_LWSYNC:
+#if defined (CONFIG_40x || CONFIG_44x || CONFIG_E500 ||
CONFIG_PPA8548 || CONFIG_TQM8548 || CONFIG_MPC8540_ADS ||
CONFIG_PPC_BOOK3S_603)
+                       asm volatile("sync" : : : "memory");
+#else
                        asm volatile("lwsync" : : : "memory");
+#endif
                        break;
 #ifdef CONFIG_PPC64
                case BARRIER_PTESYNC:


Best regards.
Michael Heltne

--000000000000ae794c05d77a83c5
Content-Type: application/x-patch; name="threader_ppc_build-0.patch"
Content-Disposition: attachment; filename="threader_ppc_build-0.patch"
Content-Transfer-Encoding: base64
Content-ID: <17e87ea4fa4c36249c71>
X-Attachment-Id: 17e87ea4fa4c36249c71

RnJvbSAyMjZlZmEwNTczMzQ1N2JiNWM0ODNmMzBhYWI2ZDVjNmEzMDQ0MjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB0aHJlYWRlciA8bWljaGFlbC5oZWx0bmVAZ21haWwuY29tPgpE
YXRlOiBTdW4sIDIzIEphbiAyMDIyIDE0OjE3OjEwICswMTAwClN1YmplY3Q6IFtQQVRDSF0gYXJj
aDogcG93ZXJwYzogZml4IGJ1aWxkaW5nIGFmdGVyIGJpbnV0aWxzIGNoYW5nZXMuICdkc3NhbGwn
CiBpbiBtbXVfY29udGV4dC5jIGlzIGFuIGFsdGl2ZWMgaW5zdHJ1Y3Rpb24sIGJ1aWxkIHRoYXQg
YWNjb3JkaW5nbHkuICdwdGVzeW5jJwogaXMgYSBQUEM2NCBpbnN0cnVjdGlvbiwgc28gZG9udCBn
byB0aGVyZSBmb3IgaWYgbm90LiBBbmQgYXBwYXJlbnRseSBpZmRlZgogX19wb3dlcnBjNjRfXyBp
c250IGVub3VnaCBpbiBhbGwgY29uZmlndXJhdGlvbnMgYW5kICdzdGJjaXgnIGFuZCBmcmllbmRz
LCBhbGwKIFBPV0VSNiBpbnN0cnVjdGlvbnMgaG9wZWZ1bGx5IG5vdCBuZWVkZWQgYnkgQ09ORklH
X1BQQzY0IGluIGdlbmVyYWwsIHdhbnRlZAogdG8gcGxheS4KCiAgICAgICAgICAgICAgICAgU2ln
bmVkLW9mZi1ieTogTWljYWhlbCBCIEhlbHRuZSA8bWljaGFlbC5oZWx0bmVAZ21haWwuY29tPgot
LS0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pby5oIHwgNyArKysrLS0tCiBhcmNoL3Bvd2Vy
cGMvbGliL3NzdGVwLmMgICAgICB8IDQgKysrLQogYXJjaC9wb3dlcnBjL21tL01ha2VmaWxlICAg
ICAgfCAzICsrKwogYXJjaC9wb3dlcnBjL21tL3BhZ2VhdHRyLmMgICAgfCA0ICsrLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9pby5oCmluZGV4IGJlYmE0OTc5YmZmOTM5Li5kM2E5YzkxY2QwNmE4YiAxMDA2NDQKLS0tIGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lvLmgKKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2lvLmgKQEAgLTMzNCw3ICszMzQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yYXdfd3Jp
dGVsKHVuc2lnbmVkIGludCB2LCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiB9CiAjZGVm
aW5lIF9fcmF3X3dyaXRlbCBfX3Jhd193cml0ZWwKIAotI2lmZGVmIF9fcG93ZXJwYzY0X18KKyNp
ZmRlZiBDT05GSUdfUFBDNjQKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX3Jhd19yZWFk
cShjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiB7CiAJcmV0dXJuICoodm9sYXRp
bGUgdW5zaWduZWQgbG9uZyBfX2ZvcmNlICopUENJX0ZJWF9BRERSKGFkZHIpOwpAQCAtMzUyLDcg
KzM1Miw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jhd193cml0ZXFfYmUodW5zaWduZWQgbG9u
ZyB2LCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiAJX19yYXdfd3JpdGVxKChfX2ZvcmNl
IHVuc2lnbmVkIGxvbmcpY3B1X3RvX2JlNjQodiksIGFkZHIpOwogfQogI2RlZmluZSBfX3Jhd193
cml0ZXFfYmUgX19yYXdfd3JpdGVxX2JlCi0KKyNlbmRpZgorI2lmZGVmIENPTkZJR19QT1dFUjZf
Q1BVCiAvKgogICogUmVhbCBtb2RlIHZlcnNpb25zIG9mIHRoZSBhYm92ZS4gVGhvc2UgaW5zdHJ1
Y3Rpb25zIGFyZSBvbmx5IHN1cHBvc2VkCiAgKiB0byBiZSB1c2VkIGluIGh5cGVydmlzb3IgcmVh
bCBtb2RlIGFzIHBlciB0aGUgYXJjaGl0ZWN0dXJlIHNwZWMuCkBAIC00MTcsNyArNDE4LDcgQEAg
c3RhdGljIGlubGluZSB1NjQgX19yYXdfcm1fcmVhZHEodm9sYXRpbGUgdm9pZCBfX2lvbWVtICpw
YWRkcikKIAkJCSAgICAgOiAiPXIiIChyZXQpIDogInIiIChwYWRkcikgOiAibWVtb3J5Iik7CiAJ
cmV0dXJuIHJldDsKIH0KLSNlbmRpZiAvKiBfX3Bvd2VycGM2NF9fICovCisjZW5kaWYgLyogQ09O
RklHX1BPV0VSNl9DUFUgKi8KIAogLyoKICAqCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGli
L3NzdGVwLmMgYi9hcmNoL3Bvd2VycGMvbGliL3NzdGVwLmMKaW5kZXggYTk0YjBjZDBiZGM1Y2Eu
LjRmZmQ2NzkxYjAzZWMwIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvbGliL3NzdGVwLmMKKysr
IGIvYXJjaC9wb3dlcnBjL2xpYi9zc3RlcC5jCkBAIC0xNDY1LDcgKzE0NjUsNyBAQCBpbnQgYW5h
bHlzZV9pbnN0cihzdHJ1Y3QgaW5zdHJ1Y3Rpb25fb3AgKm9wLCBjb25zdCBzdHJ1Y3QgcHRfcmVn
cyAqcmVncywKIAkJc3dpdGNoICgod29yZCA+PiAxKSAmIDB4M2ZmKSB7CiAJCWNhc2UgNTk4Ogkv
KiBzeW5jICovCiAJCQlvcC0+dHlwZSA9IEJBUlJJRVIgKyBCQVJSSUVSX1NZTkM7Ci0jaWZkZWYg
X19wb3dlcnBjNjRfXworI2lmZGVmIENPTkZJR19QUEM2NAogCQkJc3dpdGNoICgod29yZCA+PiAy
MSkgJiAzKSB7CiAJCQljYXNlIDE6CQkvKiBsd3N5bmMgKi8KIAkJCQlvcC0+dHlwZSA9IEJBUlJJ
RVIgKyBCQVJSSUVSX0xXU1lOQzsKQEAgLTMyNjcsOSArMzI2NywxMSBAQCB2b2lkIGVtdWxhdGVf
dXBkYXRlX3JlZ3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnN0cnVjdGlvbl9vcCAq
b3ApCiAJCWNhc2UgQkFSUklFUl9MV1NZTkM6CiAJCQlhc20gdm9sYXRpbGUoImx3c3luYyIgOiA6
IDogIm1lbW9yeSIpOwogCQkJYnJlYWs7CisjaWZkZWYgQ09ORklHX1BQQzY0CiAJCWNhc2UgQkFS
UklFUl9QVEVTWU5DOgogCQkJYXNtIHZvbGF0aWxlKCJwdGVzeW5jIiA6IDogOiAibWVtb3J5Iik7
CiAJCQlicmVhazsKKyNlbmRpZgogCQl9CiAJCWJyZWFrOwogCmRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvbW0vTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMvbW0vTWFrZWZpbGUKaW5kZXggZGY4MTcy
ZGEyMzAxYjcuLjJmODdlNzczMTU5OTdhIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvbW0vTWFr
ZWZpbGUKKysrIGIvYXJjaC9wb3dlcnBjL21tL01ha2VmaWxlCkBAIC00LDYgKzQsOSBAQAogIwog
CiBjY2ZsYWdzLSQoQ09ORklHX1BQQzY0KQk6PSAkKE5PX01JTklNQUxfVE9DKQoraWZlcSAoJChD
T05GSUdfQUxUSVZFQykseSkKK0NGTEFHU19tbXVfY29udGV4dC5vICs9ICQoY2FsbCBjYy1vcHRp
b24sIC1tYWx0aXZlYywgLW1hYmk9YWx0aXZlYykKK2VuZGlmCiAKIG9iai15CQkJCTo9IGZhdWx0
Lm8gbWVtLm8gcGd0YWJsZS5vIG1tYXAubyBtYWNjZXNzLm8gcGFnZWF0dHIubyBcCiAJCQkJICAg
aW5pdF8kKEJJVFMpLm8gcGd0YWJsZV8kKEJJVFMpLm8gXApkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL3BhZ2VhdHRyLmMgYi9hcmNoL3Bvd2VycGMvbW0vcGFnZWF0dHIuYwppbmRleCBlZGVh
Mzg4ZTlkM2ZiYi4uY2NkMDRhMzg2ZTI4ZmMgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9w
YWdlYXR0ci5jCisrKyBiL2FyY2gvcG93ZXJwYy9tbS9wYWdlYXR0ci5jCkBAIC01NCwxMSArNTQs
MTEgQEAgc3RhdGljIGludCBjaGFuZ2VfcGFnZV9hdHRyKHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBs
b25nIGFkZHIsIHZvaWQgKmRhdGEpCiAJfQogCiAJcHRlX3VwZGF0ZSgmaW5pdF9tbSwgYWRkciwg
cHRlcCwgfjBVTCwgcHRlX3ZhbChwdGUpLCAwKTsKLQorI2lmZGVmIENPTkZJR19QUEM2NAogCS8q
IFNlZSBwdGVzeW5jIGNvbW1lbnQgaW4gcmFkaXhfX3NldF9wdGVfYXQoKSAqLwogCWlmIChyYWRp
eF9lbmFibGVkKCkpCiAJCWFzbSB2b2xhdGlsZSgicHRlc3luYyI6IDogOiJtZW1vcnkiKTsKLQor
I2VuZGlmCiAJZmx1c2hfdGxiX2tlcm5lbF9yYW5nZShhZGRyLCBhZGRyICsgUEFHRV9TSVpFKTsK
IAogCXNwaW5fdW5sb2NrKCZpbml0X21tLnBhZ2VfdGFibGVfbG9jayk7Cg==
--000000000000ae794c05d77a83c5
Content-Type: text/x-patch; charset="US-ASCII"; name="threader_ppc_lwsync.patch"
Content-Disposition: attachment; filename="threader_ppc_lwsync.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kzdrr5j61>
X-Attachment-Id: f_kzdrr5j61

Ci0tLSBhL21lZGlhL3RocmVhZC8xMmZkNTBkNi1kMTRjLTQyYWYtYWQxZC1hNTk1ZTVmMDgwY2Qv
ZGV2L2xpbnV4LW1haW4vbGludXgvYXJjaC9wb3dlcnBjL2xpYi9zc3RlcC5jCisrKyBiL2hvbWUv
dGhyZWFkL2Rldi9saW51cy9saW51eC9hcmNoL3Bvd2VycGMvbGliL3NzdGVwLmMKQEAgLTMyNjUs
NyArMzI2NSwxMSBAQCB2b2lkIGVtdWxhdGVfdXBkYXRlX3JlZ3Moc3RydWN0IHB0X3JlZ3MgKnJl
Z3MsCnN0cnVjdCBpbnN0cnVjdGlvbl9vcCAqb3ApCiAgICAgICAgICAgICAgICAgICAgICAgIGVp
ZWlvKCk7CiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgY2Fz
ZSBCQVJSSUVSX0xXU1lOQzoKKyNpZiBkZWZpbmVkIChDT05GSUdfNDB4IHx8IENPTkZJR180NHgg
fHwgQ09ORklHX0U1MDAgfHwKQ09ORklHX1BQQTg1NDggfHwgQ09ORklHX1RRTTg1NDggfHwgQ09O
RklHX01QQzg1NDBfQURTIHx8CkNPTkZJR19QUENfQk9PSzNTXzYwMykKKyAgICAgICAgICAgICAg
ICAgICAgICAgYXNtIHZvbGF0aWxlKCJzeW5jIiA6IDogOiAibWVtb3J5Iik7CisjZWxzZQogICAg
ICAgICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoImx3c3luYyIgOiA6IDogIm1lbW9yeSIp
OworI2VuZGlmCiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogI2lmZGVmIENPTkZJR19Q
UEM2NAogICAgICAgICAgICAgICAgY2FzZSBCQVJSSUVSX1BURVNZTkM6Cg==
--000000000000ae794c05d77a83c5--
