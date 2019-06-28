Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AD59113
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 04:22:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZgXL2YvvzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 12:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZgTH035fzDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 12:20:01 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S2GXlE047131
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:19:57 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td63tr1sx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:19:57 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Fri, 28 Jun 2019 03:19:57 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 28 Jun 2019 03:19:51 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5S2JoLo55443882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 02:19:50 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B4BE112062;
 Fri, 28 Jun 2019 02:19:50 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEFE5112061;
 Fri, 28 Jun 2019 02:19:45 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.218.134])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 02:19:45 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v12 00/11] Appended signatures support for IMA appraisal
Date: Thu, 27 Jun 2019 23:19:23 -0300
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062802-2213-0000-0000-000003A60F42
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011344; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224269; UDB=6.00644348; IPR=6.01005459; 
 MB=3.00027497; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-28 02:19:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062802-2214-0000-0000-00005F06101F
Message-Id: <20190628021934.4260-1-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280019
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This version is essentially identical to the last one.

It is only a rebase on top of today's linux-integrity/next-queued-testing,
prompted by conflicts with Prakhar Srivastava's patches to measure the
kernel command line. It also drops two patches that are already present in
that branch.

As I mentioned in an earlier email, I believe Mimi is happy with this
version but before she can accept it I still need acks from maintainers of
the module and asymmetric keys subsystems for the first three patches.

Many thanks to Mimi Zohar for her help with the development of this patch
series.

This patch which I sent earlier today needs to be applied first:

ima: Update MAX_TEMPLATE_NAME_LEN to fit largest reasonable definition

Original cover letter:

On the OpenPOWER platform, secure boot and trusted boot are being
implemented using IMA for taking measurements and verifying signatures.
Since the kernel image on Power servers is an ELF binary, kernels are
signed using the scripts/sign-file tool and thus use the same signature
format as signed kernel modules.

This patch series adds support in IMA for verifying those signatures.
It adds flexibility to OpenPOWER secure boot, because it allows it to boot
kernels with the signature appended to them as well as kernels where the
signature is stored in the IMA extended attribute.

Changes since v11:

- Patch "integrity: Introduce struct evm_xattr"
  - Dropped since it's already in linux-integrity/next-queued-testing.

- Patch "ima: Use designated initializers for struct ima_event_data"
  - Dropped since it's already in linux-integrity/next-queued-testing.

Changes since v10:

- Patch "MODSIGN: Export module signature definitions"
  - Moved config MODULE_SIG_FORMAT definition before its use. Suggested by
    Mimi Zohar.
  - Added missing kerneldoc for @name parameter. Suggested by Mimi Zohar.

- Patch "ima: Implement support for module-style appended signatures"
  - Bugfix: don't check status variable when deciding whether to verify
    modsig in ima_appraise_measurement(). Suggested by Mimi Zohar.
  - Bugfix: verify the modsig in ima_appraise_measurement() if the xattr
    contains a digest. Suggested by Mimi Zohar.

- Patch "ima: Define ima-modsig template"
  - Renamed ima_modsig_serialize() to ima_get_raw_modsig().
  - Renamed check_current_template_modsig() to check_template_modsig().
  - Fixed outdated comment in ima_eventmodsig_init(). Suggested by Mimi
    Zohar.
  - Check either the global or the per-rule template when an appraisal rule
    allows modsig. Suggested by Mimi Zohar.

- Patch "ima: Store the measurement again when appraising a modsig"
  - Bugfix: Only re-measure file containing modsig if it was measured
    before.
  - Check for modsig-related fields in the template_desc obtained in
    process_measurement() which can be a per-rule template. Suggested by Mimi
    Zohar.

- Patch "ima: Allow template= option for appraise rules as well"
  - New patch. Suggested by Mimi Zohar.

Changes since v9:

- Patch "MODSIGN: Export module signature definitions"
  - Moved mod_check_sig() to a new file so that CONFIG_IMA_APPRAISE_MODSIG
    doesn't have to depend on CONFIG_MODULES.
  - Changed scripts/Makefile to build sign-file if CONFIG_MODULE_SIG_FORMAT
    is set.
  - Removed Mimi's Reviewed-by because of the changes in this version.

- Patch "PKCS#7: Refactor verify_pkcs7_signature()"
  - Don't add function pkcs7_get_message_sig() anymore, since it's not
    needed in the current version.

- Patch "PKCS#7: Introduce pkcs7_get_digest()"
  - Changed 'len' argument from 'u8 *' to 'u32 *'.
  - Added 'hash_algo' argument to obtain the algo used for the digest.
  - Don't check whether 'buf', 'len' and 'hash_algo' output arguments are NULL,
    since the function's only caller always sets them.
  - Removed Mimi's Reviewed-by because of the changes in this version.

- Patch "integrity: Introduce asymmetric_sig_has_known_key()"
  - Dropped.

- Patch "integrity: Introduce integrity_keyring_from_id"
  - Squashed into "ima: Implement support for module-style appended signatures"
  - Changed integrity_keyring_from_id() to a static function (suggested by Mimi
    Zohar).

- Patch "ima: Introduce is_signed()"
  - Dropped.

- Patch "ima: Export func_tokens"
  - Squashed into "ima: Implement support for module-style appended signatures"

- Patch "ima: Use designated initializers for struct ima_event_data"
  - New patch.

- Patch "ima: Factor xattr_verify() out of ima_appraise_measurement()"
  - New patch.

- Patch "ima: Implement support for module-style appended signatures"
  - Renamed 'struct modsig_hdr' to 'struct modsig'.
  - Added integrity_modsig_verify() to integrity/digsig.c so that it's not
    necessary to export integrity_keyring_from_id() (Suggested by Mimi Zohar).
  - Don't add functions ima_xattr_sig_known_key() and
    modsig_has_known_key() since they're not necessary anymore.
  - Added modsig argument to ima_appraise_measurement().
  - Verify modsig in a separate function called by ima_appraise_measurement().
  - Renamed ima_read_collect_modsig() to ima_read_modsig(), with a separate
    collect function added in patch "ima: Collect modsig" (suggested by Mimi
    Zohar).
  - In ima_read_modsig(), moved code saving of raw PKCS7 data to 'struct
    modsig' to patch "ima: Collect modsig".
  - In ima_read_modsig(), moved all parts related to the modsig hash to
    patch "ima: Collect modsig".
  - In ima_read_modsig(), don't check if the buf pointer is NULL since it's
    never supposed to happen.
  - Renamed ima_free_xattr_data() to ima_free_modsig().
  - No need to check for modsig in ima_read_xattr() and
    ima_inode_set_xattr() anymore.
  - In ima_modsig_verify(), don't check if the modsig pointer is NULL since
    it's not supposed to happen.
  - Don't define IMA_MODSIG element in enum evm_ima_xattr_type.

- Patch "ima: Collect modsig"
  - New patch.

- Patch "ima: Define ima-modsig template"
  - Patch renamed from "ima: Add new "d-sig" template field"
  - Renamed 'd-sig' template field to 'd-modsig'.
  - Added 'modsig' template field.
  - Added 'ima-modsig' defined template descriptor.
  - Renamed ima_modsig_serialize_data() to ima_modsig_serialize().
  - Renamed ima_get_modsig_hash() to ima_get_modsig_digest(). Also the
    function is a lot simpler now since what it used to do is now done in
    ima_collect_modsig() and pkcs7_get_digest().
  - Added check for failed modsig collection in ima_eventdigest_modsig_init().
  - Added modsig argument to ima_store_measurement().
  - Added 'modsig' field to struct ima_event_data.
  - Removed check for modsig == NULL in ima_get_modsig_digest() and in
    ima_modsig_serialize_data() since their callers already performs that
    check.
  - Moved check_current_template_modsig() to this patch, previously was in
    "ima: Store the measurement again when appraising a modsig".

- Patch "ima: Store the measurement again when appraising a modsig"
  - Renamed ima_template_has_sig() to ima_template_has_modsig().
  - Added a change to ima_collect_measurement(), making it to call
    ima_collect_modsig() even if IMA_COLLECT is set in iint->flags.
  - Removed IMA_READ_MEASURE flag.
  - Renamed template_has_sig global variable to template_has_modsig.
  - Renamed find_sig_in_template() to find_modsig_in_template().


Thiago Jung Bauermann (11):
  MODSIGN: Export module signature definitions
  PKCS#7: Refactor verify_pkcs7_signature()
  PKCS#7: Introduce pkcs7_get_digest()
  integrity: Select CONFIG_KEYS instead of depending on it
  ima: Add modsig appraise_type option for module-style appended
    signatures
  ima: Factor xattr_verify() out of ima_appraise_measurement()
  ima: Implement support for module-style appended signatures
  ima: Collect modsig
  ima: Define ima-modsig template
  ima: Store the measurement again when appraising a modsig
  ima: Allow template= option for appraise rules as well

 Documentation/ABI/testing/ima_policy      |   6 +-
 Documentation/security/IMA-templates.rst  |   3 +
 certs/system_keyring.c                    |  61 +++++--
 crypto/asymmetric_keys/pkcs7_verify.c     |  33 ++++
 include/crypto/pkcs7.h                    |   4 +
 include/linux/module.h                    |   3 -
 include/linux/module_signature.h          |  44 +++++
 include/linux/verification.h              |  10 ++
 init/Kconfig                              |   6 +-
 kernel/Makefile                           |   1 +
 kernel/module.c                           |   1 +
 kernel/module_signature.c                 |  46 +++++
 kernel/module_signing.c                   |  56 +------
 scripts/Makefile                          |   2 +-
 security/integrity/Kconfig                |   2 +-
 security/integrity/digsig.c               |  43 ++++-
 security/integrity/ima/Kconfig            |  13 ++
 security/integrity/ima/Makefile           |   1 +
 security/integrity/ima/ima.h              |  60 ++++++-
 security/integrity/ima/ima_api.c          |  23 ++-
 security/integrity/ima/ima_appraise.c     | 194 ++++++++++++++--------
 security/integrity/ima/ima_main.c         |  24 ++-
 security/integrity/ima/ima_modsig.c       | 169 +++++++++++++++++++
 security/integrity/ima/ima_policy.c       |  68 +++++++-
 security/integrity/ima/ima_template.c     |  26 ++-
 security/integrity/ima/ima_template_lib.c |  64 ++++++-
 security/integrity/ima/ima_template_lib.h |   4 +
 security/integrity/integrity.h            |  20 +++
 28 files changed, 819 insertions(+), 168 deletions(-)
 create mode 100644 include/linux/module_signature.h
 create mode 100644 kernel/module_signature.c
 create mode 100644 security/integrity/ima/ima_modsig.c

