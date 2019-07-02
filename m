Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C565D024
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:07:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dPfF2qRbzDqD3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 23:07:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="gWI13cK9"; 
 dkim-atps=neutral
X-Greylist: delayed 362 seconds by postgrey-1.36 at bilbo;
 Tue, 02 Jul 2019 23:03:29 AEST
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dPYs1SvXzDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 23:03:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562072575;
 bh=pVAuHARMLI90BQfldqhr/7I5PIxe6kQyhlRsdBPrcFM=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=gWI13cK9c7wkkcc+axnID5t9H1O3vp5RWnub1PZwQbLb0fiaOcCcTRp+EJtr851e8
 aSf9cCHPLIZCLK4dAwgX4DJsKNTty3TjGmFGgC8dcmdXZJdFZoVK8K8NCkKdU68y9Q
 MWTfDQhkY+IGf9SGCazybpTbmKQ0SoN/J00/Yj4k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.11.114]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MbyJ4-1i0NBo0f2c-00JJS7; Tue, 02
 Jul 2019 14:57:02 +0200
To: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] powerpc/setup: Adjust six seq_printf() calls in show_cpuinfo()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5b62379e-a35f-4f56-f1b5-6350f76007e7@web.de>
Date: Tue, 2 Jul 2019 14:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CHSj/T2I1H2IUKUbSut3k3betOz9ySJnjr+q1z0JO5FzO6JDPNu
 YDIvH23ZFoLROOrSMAWSsuESAfamBVNo1CIY8kllwqdngkMAdNN12HGClZZqq/Fh87OlHZ+
 kL5yC/NEbuUmHz0kMrBbr/hNXzKXEng4g5YHU6GXIT+9/HsOrFkPvArm2gP21g55giFp2S9
 TxQNt+sMrJecvThy62wng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r3rOcbfgVwg=:RMCqK8HEhLADnGxfA4Z3KN
 XhqGaOpSO6Ck8vcDzLvScMz2bGGIlNRoe1BwWUYS3GtHW/X3q1St9+1Dql+EhYdfxRZ+IjXu7
 0FmoCiJOgypR7bwZKGsndVKnmyqCdQv2kDwANg5lPmoFx9NDgm+mypsJPHMcEdUTbFpLU7eYv
 XsGLWRIbr6ImUqg4+UApz/XJaG3fJv2RBIST6N+rru6De5+Z7jMe50SYjBybIDiy/Zom1DpAA
 rn/LvKj80R0YfMH9d5zC1W5IIL9df9iNlMZB6YXO5zS7WyJVdNZSSPA6SqF9x0LqAfXppN0It
 UdjJGlf38jhh3tgmTTcexnZ48itPC31gMkteh4MhDG3Dsqj2OQi00Gb8hOSZk43Vfyu60lWsN
 qBhRd6C+P1bvV2rW+r3QDvhDknrKi/xH6iHrZ4y54nOY4V429Q0ebQkCMrBAAju0mXIDpU7SZ
 qdwF7cHmvb/1qYsLv750+B3y9nVdWWGN2z3AfPGdXKHmxHD7tdZY0dqwsk9qi+6vRz2xaYjNk
 3Ldny0siwAMz2Eh3ZjdeYp8hGjDYEIpJBtZ4gDxI5Y5kOAvKnWlPPQRqRjWyiQ4ETcdeCkJcJ
 1/CtHeLYrWckwYKcO9AktocR0X/NB8F1i8DoSHn6aSTIwktqC76An8l2Rrh5a0NobPGoasJNn
 TouIy/mT0cuxTxGQ9liWbsaN7L9QBeJLcL9rJGwSHow1HfZA4pUkYepoNf5iwzybhXJ7LHFfh
 ZPxUc7WIUoPQiqDRT8DvMiY8hUNgsH+QOnP41Qvp3ejVck2cnvLFd26YHLBR9R5SAkLBgSq9b
 j2JuOJK3SAKaIAC4qj4gA9eXlS7FFtRIKmh+345Tkvct+GK27+Yl35wzkEeUm6mAG3MWXRvve
 mWR7SYWCsSaBl1pXtvCk834xZx/mfQj1Wrd1JPmjUXN/44yaKtzc36f9tX4BfQN3QmynBR4o0
 7HuBp8DbxQXmzRpPoIY3GPB+aBk97sTvzQQsuKIUscN6FOQoGtCScd2SLd8QRM7wyTWVLI6RO
 /nncdE/iEjSQK5Eed1t8t6y3y6Ma34Ivm4mh3v3n5V1yMi/HgnOOP4VOCFlddIeMLFSqzXMB3
 HqWzcsNbE+RgYU/NmCx+cCdL9t4eUrKFrsC
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 14:41:42 +0200

A bit of information should be put into a sequence.
Thus improve the execution speed for this data output by better usage
of corresponding functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/kernel/setup-common.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setu=
p-common.c
index 1f8db666468d..a381723b11bd 100644
=2D-- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -239,18 +239,17 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	maj =3D (pvr >> 8) & 0xFF;
 	min =3D pvr & 0xFF;

-	seq_printf(m, "processor\t: %lu\n", cpu_id);
-	seq_printf(m, "cpu\t\t: ");
+	seq_printf(m, "processor\t: %lu\ncpu\t\t: ", cpu_id);

 	if (cur_cpu_spec->pvr_mask && cur_cpu_spec->cpu_name)
-		seq_printf(m, "%s", cur_cpu_spec->cpu_name);
+		seq_puts(m, cur_cpu_spec->cpu_name);
 	else
 		seq_printf(m, "unknown (%08x)", pvr);

 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		seq_printf(m, ", altivec supported");
+		seq_puts(m, ", altivec supported");

-	seq_printf(m, "\n");
+	seq_putc(m, '\n');

 #ifdef CONFIG_TAU
 	if (cpu_has_feature(CPU_FTR_TAU)) {
@@ -332,7 +331,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "bogomips\t: %lu.%02lu\n", loops_per_jiffy / (500000 / HZ=
),
 			   (loops_per_jiffy / (5000 / HZ)) % 100);

-	seq_printf(m, "\n");
+	seq_putc(m, '\n');

 	/* If this is the last cpu, print the summary */
 	if (cpumask_next(cpu_id, cpu_online_mask) >=3D nr_cpu_ids)
=2D-
2.22.0

